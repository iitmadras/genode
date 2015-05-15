include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

NETBSD_CFLAGS := \
    $(libc_common_cflags) \
    -Wno-sign-compare -Wno-uninitialized \
    -DPOSIX_MISTAKE \
    -I$(LOCAL_PATH)/upstream-netbsd/android/include \
    -I$(LOCAL_PATH)/upstream-netbsd/lib/libc/include \
    -include netbsd-compat.h \
    -fPIC

NETBSD_CONLYFLAGS = $(libc_common_conlyflags)
NETBSD_CPPFLAGS = $(libc_common_cppflags)

CC_OPT = $(NETBSD_CFLAGS)
CC_C_OPT = $(NETBSD_CONLYFLAGS)
CC_CXX_OPT = $(NETBSD_CPPFLAGS)

SRC_C = $(libc_upstream_netbsd_src_files)

vpath % $(LOCAL_PATH)/upstream-netbsd/common/lib/libc/stdlib/
vpath % $(LOCAL_PATH)/upstream-netbsd/lib/libc/gen/
vpath % $(LOCAL_PATH)/upstream-netbsd/lib/libc/inet/
vpath % $(LOCAL_PATH)/upstream-netbsd/lib/libc/regex/
vpath % $(LOCAL_PATH)/upstream-netbsd/lib/libc/stdlib/
vpath % $(LOCAL_PATH)/upstream-netbsd/lib/libc/string/
vpath % $(LOCAL_PATH)/upstream-netbsd/lib/libc/unistd/
vpath % $(LOCAL_PATH)/upstream-netbsd/lib/libc/resolv/

