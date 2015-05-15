#######################################################################
# gtest_main lib host

include $(REP_DIR)/lib/mk/gtest_common.inc


LIBS += bionic libcxx libcxxabi

INC_DIR += $(LOCAL_PATH) \
	$(LOCAL_PATH)/include


LOCAL_CFLAGS += $(libgtest_cflags) -D__linux__
LOCAL_MODULE := libgtest_main_host

CC_OPT += $(LOCAL_CFLAGS)
SRC_CC += src/gtest_main.cc \
	#src/gtest.cc
 
vpath %.cc $(LOCAL_PATH)/
