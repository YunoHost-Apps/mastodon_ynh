#!/bin/bash

#=================================================
# PACKAGE UPDATING HELPER
#=================================================

# This script is meant to be run by GitHub Actions
# The YunoHost-Apps organisation offers a template Action to run this script periodically
# Since each app is different, maintainers can adapt its contents so as to perform
# automatic actions when a new upstream release is detected.

#=================================================
# FETCHING LATEST RELEASE AND ITS ASSETS
#=================================================

# Fetching information
current_version=$(cat manifest.json | jq -j '.version|split("~")[0]')
repo=$(cat manifest.json | jq -j '.upstream.code|split("https://github.com/")[1]')
# Some jq magic is needed, because the latest upstream release is not always the latest version (e.g. security patches for older versions)
version=$(curl --silent "https://api.github.com/repos/$repo/releases" | jq -r '.[] | select( .prerelease != true ) | .tag_name' | sort -V | tail -1)
assets="https://github.com/tootsuite/mastodon/archive/refs/tags/$version.tar.gz"

# Later down the script, we assume the version has only digits and dots
# Sometimes the release name starts with a "v", so let's filter it out.
# You may need more tweaks here if the upstream repository has different naming conventions.
if [[ ${version:0:1} == "v" || ${version:0:1} == "V" ]]; then
    version=${version:1}
fi

# Setting up the environment variables
echo "Current version: $current_version"
echo "Latest release from upstream: $version"
echo "VERSION=$version" >> $GITHUB_ENV
# For the time being, let's assume the script will fail
echo "PROCEED=false" >> $GITHUB_ENV

# Proceed only if the retrieved version is greater than the current one
if ! dpkg --compare-versions "$current_version" "lt" "$version" ; then
    echo "::warning ::No new version available"
    exit 0
# Proceed only if a PR for this new version does not already exist
elif git ls-remote -q --exit-code --heads https://github.com/$GITHUB_REPOSITORY.git ci-auto-update-v$version ; then
    echo "::warning ::A branch already exists for this update"
    exit 0
fi

#=================================================
# UPDATE SOURCE FILES
#=================================================

# Let's download source tarball
asset_url=$assets

echo "Handling asset at $asset_url"

src="app"

# Create the temporary directory
tempdir="$(mktemp -d)"

# Download sources and calculate checksum
filename=${asset_url##*/}
curl --silent -4 -L $asset_url -o "$tempdir/$filename"
checksum=$(sha256sum "$tempdir/$filename" | head -c 64)

# Delete temporary directory
rm -rf $tempdir

# Get extension
if [[ $filename == *.tar.gz ]]; then
  extension=tar.gz
else
  extension=${filename##*.}
fi

# Rewrite source file
cat <<EOT > conf/$src.src
SOURCE_URL=$asset_url
SOURCE_SUM=$checksum
SOURCE_SUM_PRG=sha256sum
SOURCE_FORMAT=$extension
SOURCE_IN_SUBDIR=true
SOURCE_FILENAME=
EOT
echo "... conf/$src.src updated"

#=================================================
# SPECIFIC UPDATE STEPS
#=================================================

# Any action on the app's source code can be done.
# The GitHub Action workflow takes care of committing all changes after this script ends.

#=================================================
# GENERIC FINALIZATION
#=================================================

# Replace new version in manifest
echo "$(jq -s --indent 4 ".[] | .version = \"$version~ynh1\"" manifest.json)" > manifest.json

# No need to update the README, yunohost-bot takes care of it

# The Action will proceed only if the PROCEED environment variable is set to true
echo "PROCEED=true" >> $GITHUB_ENV
exit 0
