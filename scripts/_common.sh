#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="imagemagick ffmpeg libpq-dev libxml2-dev libxslt1-dev file git-core g++ libprotobuf-dev protobuf-compiler pkg-config gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3|libgdbm6 libgdbm-dev redis-server redis-tools postgresql postgresql-contrib libidn11-dev libicu-dev libjemalloc-dev curl apt-transport-https"

MEMORY_NEEDED="2560"

if [ "$(lsb_release --codename --short)" = "buster" ]; then
    RUBY_VERSION="2.6.6"
    BUNDLER_VERSION="1.17.3"
    NODEJS_VERSION="12"
else
    RUBY_VERSION="2.6.5"
    BUNDLER_VERSION="1.17.3"
    NODEJS_VERSION="10"
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
