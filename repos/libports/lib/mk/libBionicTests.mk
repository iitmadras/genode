# -----------------------------------------------------------------------------
# Library of all tests (excluding the dynamic linker tests).
# module := libBionicTests
# -----------------------------------------------------------------------------

include $(REP_DIR)/lib/mk/libBionicTestSrc.inc
libBionicTests_whole_static_libraries := \
    libBionicStandardTests \
    fortify1-tests-gcc \
    fortify2-tests-gcc

LIBS += $(libBionicTests_whole_static_libraries)
module := libBionicTests
module_tag := optional
build_target := STATIC_TEST_LIBRARY
build_type := host

include $(REP_DIR)/lib/mk/libBionicTestAndroidbuild.inc

INC_DIR += $(LOCAL_C_INCLUDES)

SRC_CC += $(LOCAL_SRC_FILES)


CC_OPT += $(LOCAL_CFLAGS) -D__ANDROID__ -D__linux__ -D_GNU_SOURCE
CC_C_OPT += $(LOCAL_CONLYFLAGS)
CC_CXX_OPT += $(LOCAL_CPPFLAGS)

vpath %.cpp $(LOCAL_PATH)/

