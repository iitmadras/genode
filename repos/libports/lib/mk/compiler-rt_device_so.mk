
#=====================================================================
# Device Shared Library: libcompiler_rt
#=====================================================================


include $(REP_DIR)/lib/mk/compiler-rt_common.inc

LIBS += compiler-rt_a

vpath %.c $(LOCAL_PATH)/
vpath %.S $(LOCAL_PATH)/
