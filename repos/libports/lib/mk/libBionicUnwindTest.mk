# -----------------------------------------------------------------------------
# module := libBionicUnwindTest
# -----------------------------------------------------------------------------
include $(REP_DIR)/lib/mk/libBionicTestSrc.inc
libBionicUnwindTest_cflags := \
    $(test_cflags) \
    -fexceptions \
    -fnon-call-exceptions \

libBionicUnwindTest_src_files := \
    stack_unwinding_test_impl.c \

 
module := libBionicUnwindTest
module_tag := optional
build_type := host
build_target := STATIC_TEST_LIBRARY
include $(REP_DIR)/lib/mk/libBionicTestAndroidbuild.inc

INC_DIR += $(LOCAL_C_INCLUDES)
SRC_C += $(libBionicUnwindTest_src_files)


CC_OPT += $(LOCAL_CFLAGS) -D__ANDROID__ -D__linux__ -D_GNU_SOURCE
CC_C_OPT += $(LOCAL_CONLYFLAGS)
CC_CXX_OPT += $(LOCAL_CPPFLAGS)


vpath %.c $(LOCAL_PATH)/
