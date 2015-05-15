#=====================================================================
# Device Static Library: libprofile_rt
#=====================================================================

include $(REP_DIR)/lib/mk/compiler-rt_common.inc


LOCAL_SRC_FILES = lib/profile/GCDAProfiling.c

LIBS += bionic libunwindbacktrace

SRC_C = $(LOCAL_SRC_FILES)	

vpath %.c $(LOCAL_PATH)/
