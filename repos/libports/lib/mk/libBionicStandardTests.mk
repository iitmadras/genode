


include $(REP_DIR)/lib/mk/libBionicTestSrc.inc

libBionicStandardTests_cflags := \
    $(test_cflags) \

ifeq ($(MALLOC_IMPL),dlmalloc)
  libBionicStandardTests_cflags += -DUSE_DLMALLOC
else
  libBionicStandardTests_cflags += -DUSE_JEMALLOC
endif

libBionicStandardTests_cppflags := \
    $(test_cppflags) \

libBionicStandardTests_c_includes := \
    $(BIONIC_INLCUDE)/


LIBS += bionic libcxx libcxxabi bionic_libm_so libgtest_host libBionicUnwindTest

libBionicStandardTests_ldlibs_host := \
    -lrt \


module := libBionicStandardTests
module_tag := optional
build_type := host
build_target := STATIC_TEST_LIBRARY
include $(REP_DIR)/lib/mk/libBionicTestAndroidbuild.inc


INC_DIR += $(LOCAL_C_INCLUDES)

SRC_CC += $(LOCAL_SRC_FILES)


CC_OPT += $(LOCAL_CFLAGS) -D__ANDROID__ -D__linux__ -D_GNU_SOURCE
CC_C_OPT += $(LOCAL_CONLYFLAGS)
CC_CXX_OPT += $(LOCAL_CPPFLAGS)

