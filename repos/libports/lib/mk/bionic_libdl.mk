include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc
LOCAL_PATH_DL = $(BIONIC_DIR)/libdl


CC_OPT := -Wall -Wextra -Wunused -Werror


CC_C_OPT = $(LOCAL_CFLAGS)
SRC_C = libdl.c

vpath %.c $(LOCAL_PATH_DL)/
SHARED_LIB  = yes
