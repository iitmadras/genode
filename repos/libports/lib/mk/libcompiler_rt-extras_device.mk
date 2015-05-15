
include $(REP_DIR)/lib/mk/compiler-rt_common.inc

#=====================================================================
# Device Static Library: libcompiler_rt-extras
#=====================================================================

#include $(CLEAR_VARS)

#LOCAL_MODULE := libcompiler_rt-extras
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_CLASS := STATIC_LIBRARIES
#LOCAL_CLANG := true
LOCAL_SRC_FILES := $(libcompiler_rt_extras_SRC_FILES)
LIBS += bionic libunwindbacktrace

#LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

#include $(BUILD_STATIC_LIBRARY)

# Don't build compiler-rt without clang
#ifneq ($(WITHOUT_TARGET_CLANG), true)

SRC_C = $(LOCAL_SRC_FILES)

vpath %.c $(LOCAL_PATH)/

