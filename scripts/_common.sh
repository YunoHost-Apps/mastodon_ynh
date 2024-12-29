#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

memory_needed="2560"
ruby_version=3.3.5
nodejs_version=20

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

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
