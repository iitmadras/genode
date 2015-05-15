# host static lib

include $(REP_DIR)/lib/mk/libcxx_common.inc

bionic_dir := $(call select_from_ports,bionic)
LIBCXX_ABI := $(call select_from_ports,libcxxabi)

LOCAL_SRC_FILES := $(LIBCXX_SRC_FILES)
LOCAL_C_INCLUDES := $(LIBCXX_C_INCLUDES)
LOCAL_CPPFLAGS := $(LIBCXX_CPPFLAGS)

INC_DIR += $(LOCAL_PATH)/include/
INC_DIR += $(LIBCXX_ABI)/include/
INC_DIR += $(bionic_dir)/include

LIBS += libunwindbacktrace bionic 


CC_OPT += $(LOCAL_C_INCLUDES)
CC_CXX_OPT +=  $(LOCAL_CPPFLAGS)
SRC_CC += $(LOCAL_SRC_FILES)

vpath %.cpp $(LOCAL_PATH)/
