#
#
#

#LOCAL_PATH := $(call my-dir)

LIBUNWIND_PORT_DIR := $(call select_from_ports,libunwind)
LOCAL_PATH := $(LIBUNWIND_PORT_DIR)/src/lib/libunwind
BIONIC_PORT_DIR := $(call select_from_ports,bionic)
HOST_OS =true
build_host := false

ifeq ($(HOST_OS),linux)
build_host := true
endif

# Set to true to enable a debug build of the libraries.
# To control what is logged, set the environment variable UNW_DEBUG_LEVEL=x,
# where x controls the verbosity (from 1 to 20).
debug := false

common_cflags := \
	-Wno-unused-parameter \
	#-Werror \

# gcc 4.8 appears to be overeager declaring that a variable is uninitialized,
# under certain circumstances. Turn off this warning only for target so that
# coverage is still present for the host code. When the entire build system
# is switched to 4.9, then this can be removed.
common_cflags_target := \
	-Wno-maybe-uninitialized \

ifeq ($(LOCAL_CLANG),true)
# src/mi/backtrace.c is misdetected as a bogus header guard by clang 3.5
common_cflags += -Wno-header-guard
endif

ifneq ($(debug),true)
common_cflags += \
	-DHAVE_CONFIG_H \
	-DNDEBUG \
	-D_GNU_SOURCE \

else
common_cflags += \
	-DHAVE_CONFIG_H \
	-DDEBUG \
	-D_GNU_SOURCE \
	-U_FORTIFY_SOURCE \
	

endif


#paramesh
common_cflags += \
	-D__linux__


	
common_c_includes := \
	$(LOCAL_PATH)/src \
	$(LOCAL_PATH)/include \

# Since mips and mips64 use the same source, only generate includes/srcs
# for the below set of arches.
#generate_arches := arm arm64 mips x86 x86_64 #paramesh
# The complete list of arches used by Android.build.mk to set arch
# variables.
#libunwind_arches := $(generate_arches) mips64 #paramesh

generate_arches := x86_64
libunwind_arches := $(generate_arches)

$(foreach arch,$(generate_arches), \
  $(eval common_c_includes_$(arch) := $(LOCAL_PATH)/include/tdep-$(arch)))
