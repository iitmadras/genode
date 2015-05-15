# -----------------------------------------------------------------------------
# Fortify tests.
# module := fortify2-tests-gcc
# -----------------------------------------------------------------------------
include $(REP_DIR)/lib/mk/libBionicTestSrc.inc
$(foreach compiler,gcc, \
  $(foreach test,1 2, \
    $(eval fortify$(test)-tests-$(compiler)_cflags := \
      $(test_cflags) \
      -U_FORTIFY_SOURCE \
      -D_FORTIFY_SOURCE=$(test) \
      -DTEST_NAME=Fortify$(test)_$(compiler)); \
    $(eval fortify$(test)-tests-$(compiler)_cflags_host := \
      -Wno-error); \
    $(eval fortify$(test)-tests-$(compiler)_src_files := \
      fortify_test.cpp); \
    $(eval fortify_libs += fortify$(test)-tests-$(compiler)); \
  ) \
)

LIBS += libcxx libcxxabi bionic gtest
module := fortify2-tests-gcc
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

