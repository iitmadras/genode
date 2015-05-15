include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

LIBS += bionic_libc_bionic

SRC_C := $(libc_malloc_src)  
#upstream-dlmalloc/malloc.c
CC_OPT := $(libc_common_cflags) \
    -fvisibility=hidden \
    -fPIC

CC_C_OPT := $(libc_common_conlyflags)
CC_CXX_OPT := $(libc_common_cppflags)

vpath %.c $(LOCAL_PATH)/bionic

