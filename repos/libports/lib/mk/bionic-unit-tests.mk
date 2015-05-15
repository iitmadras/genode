
include $(REP_DIR)/lib/mk/libBionicTestSrc.inc

bionic-unit-tests_whole_static_libraries := \
    libBionicTests \
    libcxx \
    libcxxabi \
    bionic \
    gtest

bionic-unit-tests_src_files := \
    atexit_test.cpp \
    dlfcn_test.cpp \
    #dlext_test.cpp \

bionic-unit-tests_cflags := $(test_cflags)
bionic-unit-tests_cppflags := $(test_cppflags)

bionic-unit-tests_ldflags := \
    -Wl,--export-dynamic \
    -Wl,-u,DlSymTestFunction \

bionic-unit-tests_c_includes := \
    $(call include-path-for, libpagemap) \

bionic-unit-tests_shared_libraries_target := \
    bionic_libdl \

 #   libpagemap \

module := bionic-unit-tests
module_tag := optional
build_type := target
build_target := NATIVE_TEST
include $(REP_DIR)/lib/mk/libBionicTestAndroidbuild.inc

LIBS += $(bionic-unit-tests_whole_static_libraries)

CC_OPT += $(bionic-unit-tests_cflags) $(bionic-unit-tests_ldflags) \
	-D__ANDROID__ -D__linux__ -D_GNU_SOURCE
CC_CXX_OPT += $(bionic-unit-tests_cppflags)


SRC_CC += $(bionic-unit-tests_src_files)

