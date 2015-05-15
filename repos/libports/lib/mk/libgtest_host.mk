#######################################################################
# gtest lib host


include $(REP_DIR)/lib/mk/gtest_common.inc

INC_DIR += $(libgtest_host_includes)

LIBS += bionic \
	libcxx \
	libcxxabi  

CC_OPT += $(libgtest_cflags) -D__linux__ -D_GNU_SOURCE -D__ANDROID__
CC_CXX_OPT += -std=c++11

SRC_CC += \
    src/gtest-all.cc \

vpath %.cc $(LOCAL_PATH)/
