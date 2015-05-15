include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

LIBS += binoic_libc_common

SRC_CC := \
    $(libc_arch_static_src_files) \
    $(libc_static_common_src_files) \
     libc_init_static.cpp \
     malloc_debug_common.cpp \
    
CC_OPT := $(libc_common_cflags) \
    -DLIBC_STATIC \
    -fPIC

CC_C_OPT := $(libc_common_conlyflags)
CC_CXX_OPT := $(libc_common_cppflags)

vpath %.cpp $(LOCAL_PATH)/bionic
