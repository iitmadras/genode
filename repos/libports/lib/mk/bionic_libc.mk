include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc


LIBS := bionic_libc_tzcode 
#bionic_libdl bionic_libc_common

CC_OPT := $(libc_common_cflags)
CC_C_OPT := $(libc_common_conlyflags)
CC_CXX_OPT := $(libc_common_cppflags)


SRC_CC = \
    $(libc_arch_dynamic_src_files) \
    $(libc_static_common_src_files) \
    $(LOCAL_PATH)/bionic/malloc_debug_common.cpp \
    $(LOCAL_PATH)/bionic/debug_mapinfo.cpp \
    $(LOCAL_PATH)/bionic/debug_stacktrace.cpp \
    $(LOCAL_PATH)/bionic/libc_init_dynamic.cpp \
    $(LOCAL_PATH)/bionic/NetdClient.cpp \



