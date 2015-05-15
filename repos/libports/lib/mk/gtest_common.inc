GTEST_DIR := $(call select_from_ports,gtest)
LOCAL_PATH      := $(GTEST_DIR)/src/gtest

libgtest_target_includes := \
  $(LOCAL_PATH)/include \
  $(LOCAL_PATH)/

libgtest_host_includes := \
  $(LOCAL_PATH)/include \
  $(LOCAL_PATH)/

libgtest_cflags := \
  -Wno-missing-field-initializers \
