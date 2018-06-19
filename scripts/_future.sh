#!/bin/bash

# needed to have "service_name" as an option
# https://github.com/YunoHost/yunohost/commit/9c4ddcca39d9d6d92bd5f9a23978337e48d0a4e1
ynh_add_systemd_config () {
	local service_name="${1:-$app}"

	finalsystemdconf="/etc/systemd/system/$service_name.service"
	ynh_backup_if_checksum_is_different "$finalsystemdconf"
	sudo cp ../conf/${2:-systemd.service} "$finalsystemdconf"

	# To avoid a break by set -u, use a void substitution ${var:-}. If the variable is not set, it's simply set with an empty variable.
	# Substitute in a nginx config file only if the variable is not empty
	if test -n "${final_path:-}"; then
		ynh_replace_string "__FINALPATH__" "$final_path" "$finalsystemdconf"
	fi
	if test -n "${app:-}"; then
		ynh_replace_string "__APP__" "$app" "$finalsystemdconf"
	fi
	ynh_store_file_checksum "$finalsystemdconf"

	sudo chown root: "$finalsystemdconf"
	sudo systemctl enable $service_name
	sudo systemctl daemon-reload
}

# needed to have "service_name" as an option
# https://github.com/YunoHost/yunohost/commit/9c4ddcca39d9d6d92bd5f9a23978337e48d0a4e1
ynh_remove_systemd_config () {
	local service_name="${1:-$app}"

	local finalsystemdconf="/etc/systemd/system/$service_name.service"
	if [ -e "$finalsystemdconf" ]; then
		sudo systemctl stop $service_name
		sudo systemctl disable $service_name
		ynh_secure_remove "$finalsystemdconf"
		sudo systemctl daemon-reload
	fi
}


# LOCAL ADDITION:
# save file locally if not in the cache
#
# Download, check integrity, uncompress and patch the source from app.src
ynh_setup_source () {
    local dest_dir=$1
    local src_id=${2:-app} # If the argument is not given, source_id equals "app"

    # Load value from configuration file (see above for a small doc about this file
    # format)
    local src_url=$(grep 'SOURCE_URL=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
    local src_sum=$(grep 'SOURCE_SUM=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
    local src_sumprg=$(grep 'SOURCE_SUM_PRG=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
    local src_format=$(grep 'SOURCE_FORMAT=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
    local src_in_subdir=$(grep 'SOURCE_IN_SUBDIR=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)
    local src_filename=$(grep 'SOURCE_FILENAME=' "$YNH_CWD/../conf/${src_id}.src" | cut -d= -f2-)

    # Default value
    src_sumprg=${src_sumprg:-sha256sum}
    src_in_subdir=${src_in_subdir:-true}
    src_format=${src_format:-tar.gz}
    src_format=$(echo "$src_format" | tr '[:upper:]' '[:lower:]')
    if [ "$src_filename" = "" ] ; then
        src_filename="${src_id}.${src_format}"
    fi
    local local_src="/var/cache/yunohost/ynh_setup_source/${YNH_APP_ID}/${src_filename}"

    # if cache file exists and the checksum isn't good, download it again
    # if not, just download the file

    if test -e "$local_src"
    then
    	echo "${src_sum} ${local_src}" | ${src_sumprg} -c --status \
        	|| wget -nv -O $local_src $src_url
    else
    	mkdir -p "/var/cache/yunohost/ynh_setup_source/${YNH_APP_ID}"
    	wget -nv -O $local_src $src_url
    fi
    cp $local_src $src_filename

    # Check the control sum
    echo "${src_sum} ${src_filename}" | ${src_sumprg} -c --status \
        || ynh_die "Corrupt source"

    # Extract source into the app dir
    mkdir -p "$dest_dir"
    if [ "$src_format" = "zip" ]
    then
        # Zip format
        # Using of a temp directory, because unzip doesn't manage --strip-components
        if $src_in_subdir ; then
            local tmp_dir=$(mktemp -d)
            unzip -quo $src_filename -d "$tmp_dir"
            cp -a $tmp_dir/*/. "$dest_dir"
            ynh_secure_remove "$tmp_dir"
        else
            unzip -quo $src_filename -d "$dest_dir"
        fi
    else
        local strip=""
        if $src_in_subdir ; then
            strip="--strip-components 1"
        fi
        if [[ "$src_format" =~ ^tar.gz|tar.bz2|tar.xz$ ]] ; then
            tar -xf $src_filename -C "$dest_dir" $strip
        else
            ynh_die "Archive format unrecognized."
        fi
    fi

    # Apply patches
    if (( $(find $YNH_CWD/../sources/patches/ -type f -name "${src_id}-*.patch" 2> /dev/null | wc -l) > "0" )); then
        local old_dir=$(pwd)
        (cd "$dest_dir" \
            && for p in $YNH_CWD/../sources/patches/${src_id}-*.patch; do \
                patch -p1 < $p; done) \
            || ynh_die "Unable to apply patches"
        cd $old_dir
    fi

    # Add supplementary files
    if test -e "$YNH_CWD/../sources/extra_files/${src_id}"; then
        cp -a $YNH_CWD/../sources/extra_files/$src_id/. "$dest_dir"
    fi
}

