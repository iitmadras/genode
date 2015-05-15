#=====================================================================
# Host Shared Library: libcompiler_rt
#=====================================================================



include $(REP_DIR)/lib/mk/compiler-rt_common.inc


TARGET=libcompiler_rt
LOCAL_CPPFLAGS := -nostdinc++
LOCAL_LDFLAGS := -nodefaultlibs
LOCAL_LDLIBS := -lc -lm

LIBS += compiler-rt_a bionic

CC_CXX_OPT = $(LOCAL_CPPFLAGS)


vpath %.c $(LOCAL_PATH)/
vpath %.S $(LOCAL_PATH)/
