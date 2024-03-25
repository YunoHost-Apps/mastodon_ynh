#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

memory_needed="2560"
ruby_version=3.2.2
nodejs_version=20

# Workaround for Mastodon on Bullseye
# See https://github.com/mastodon/mastodon/issues/15751#issuecomment-873594463
if [ "$(lsb_release --codename --short)" = "bullseye" ];
then
	case $YNH_ARCH in
		amd64)
			ld_preload="LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so"
			;;
		arm64)
			ld_preload="LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libjemalloc.so"
			;;
		armhf)
			ld_preload="LD_PRELOAD=/usr/lib/arm-linux-gnueabihf/libjemalloc.so"
			;;
		armel)
			ld_preload="LD_PRELOAD=/usr/lib/arm-linux-gnueabi/libjemalloc.so"
			;;
		i386)
			ld_preload="LD_PRELOAD=/usr/lib/i386-linux-gnu/libjemalloc.so"
			;;
	esac
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
