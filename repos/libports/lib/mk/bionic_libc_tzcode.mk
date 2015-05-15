
include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

tz_src := \
	wcsftime.c \
	difftime.c \
	localtime.c \
	asctime.c \
	strptime.c \
	strftime.c \


LOCAL_CFLAGS := \
    -fvisibility=hidden \
    -fPIC \
    $(libc_common_cflags) \


LOCAL_CFLAGS += -DALL_STATE

LOCAL_CFLAGS += -DSTD_INSPIRED

LOCAL_CFLAGS += -DTM_GMTOFF=tm_gmtoff

#LOCAL_CFLAGS += -DTZDIR=\"/system/usr/share/zoneinfo\"

LOCAL_CFLAGS += -DUSG_COMPAT=1
LOCAL_CFLAGS += -DNO_RUN_TIME_WARNINGS_ABOUT_YEAR_2000_PROBLEMS_THANK_YOU
LOCAL_CFLAGS += -Dlint
LOCAL_CLANG := $(use_clang)

SRC_C += $(tz_src) 
#CC_OPT += $(LOCAL_CFLAGS)
CC_C_OPT += $(libc_common_conlyflags)
CC_CXX_OPT = $(libc_common_cppflags)

 
vpath %.c $(LOCAL_PATH)/tzcode/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/time/

