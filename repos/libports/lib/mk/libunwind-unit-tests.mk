include $(REP_DIR)/lib/mk/libunwind_common.inc

#-----------------------------------------------------------------------
# libunwind testing
#-----------------------------------------------------------------------
libunwind-unit-tests_cflags := \
	-fno-builtin \
	-O0 \
	-g \

libunwind-unit-tests_c_includes := \
	$(LOCAL_PATH)/include \

libunwind-unit-tests_src_files := \
	android/tests/local_test.cpp \

libunwind-unit-tests_shared_libraries := \
	libunwind \

libunwind-unit-tests_multilib := both
module := libunwind-unit-tests
module_tag := optional
#build_type := target
build_target := NATIVE_TEST
#include $(LOCAL_PATH)/Android.build.mk
build_type := host
#include $(LOCAL_PATH)/Android.build.mk


include $(REP_DIR)/lib/mk/libunwind_build.inc

LIBS += bionic libunwind $(LOCAL_STATIC_LIBRARIES) $(LOCAL_WHOLE_STATIC_LIBRARIES) $(LOCAL_SHARED_LIBRARIES)


INC_DIR += $(LOCAL_C_INCLUDES)  $(LOCAL_C_INCLUDES_x86_64)

CC_LD_OPT = $(LOCAL_LDFLAGS)
CC_OPT = $(LOCAL_CFLAGS)
CC_C_OPT = $(LOCAL_CONLYFLAGS)
CC_CXX_OPT = $(LOCAL_CPPFLAGS)

SRC_CC = $(LOCAL_SRC_FILES) $(LOCAL_SRC_FILES_x86_64)


vpath %.cpp $(LOCAL_PATH)/
#vpath %.S $(LOCAL_PATH)/

