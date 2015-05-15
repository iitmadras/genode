include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc



CC_OPT := $(libc_common_cflags) -fno-builtin -fPIC

SRC_C = __aeabi.c

vpath %.c $(LOCAL_PATH)/arch-arm/bionic/
