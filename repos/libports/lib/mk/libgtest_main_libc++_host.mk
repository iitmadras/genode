#######################################################################
# libc++
#LOCAL_MODULE := libgtest_main_libc++_host
#######################################################################

include $(REP_DIR)/lib/mk/gtest_common.inc


LOCAL_C_INCLUDES :=  -D__linux__ -D_GNU_SOURCE -D__ANDROID__
LOCAL_CFLAGS += $(libgtest_cflags)
LOCAL_MULTILIB := both

LIBS += bionic \
	libcxx \
	libcxxabi  \
	libgtest_host


INC_DIR += $(LOCAL_PATH) \
	$(LOCAL_PATH)/include
 

LOCAL_CPPFLAGS += -nostdinc++

 
SRC_CC += \
    src/gtest_main.cc \
    
CC_OPT += $(LOCAL_C_INCLUDES) 
CC_CXX_OPT += $(LOCAL_CPP_INCLUDES)

vpath %.cc $(LOCAL_PATH)/
