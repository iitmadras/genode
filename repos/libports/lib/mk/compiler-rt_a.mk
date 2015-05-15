#=====================================================================
# Host Static Library: libcompiler_rt
#=====================================================================


include $(REP_DIR)/lib/mk/compiler-rt_common.inc
LOCAL_MULTILIB := both

LIBS += bionic bionic_libm_so libunwindbacktrace

SRC_C = $(libcompiler_rt_common_SRC_FILES) 
SRC_S = $(libcompiler_rt_x86_SRC_FILES) 

vpath %.c $(LOCAL_PATH)/
vpath %.S $(LOCAL_PATH)/
