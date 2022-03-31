#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="imagemagick ffmpeg libpq-dev libxml2-dev libxslt1-dev file git-core g++ libprotobuf-dev protobuf-compiler pkg-config gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3|libgdbm6 libgdbm-dev postgresql postgresql-contrib libidn11-dev libicu-dev libjemalloc-dev curl apt-transport-https"

MEMORY_NEEDED="2560"

RUBY_VERSION="2.7.2"

NODEJS_VERSION="16"

# Workaround for Mastodon on Bullseye
# See https://github.com/mastodon/mastodon/issues/15751#issuecomment-873594463
if [ "$(lsb_release --codename --short)" = "bullseye" ]; then
    case $YNH_ARCH in
        amd64)
            arch="x86_64"
            ;;
        arm64)
            arch="aarch64"
            ;;
        armel|armhf)
            arch="arm"
            ;;
        i386)
            arch="i386"
            ;;
    esac
    ld_preload="LD_PRELOAD=/usr/lib/$arch-linux-gnu/libjemalloc.so"
else
    ld_preload=""
fi

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
