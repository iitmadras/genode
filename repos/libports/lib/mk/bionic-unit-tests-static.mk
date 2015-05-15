
bionic-unit-tests-static_whole_static_libraries := \
    libBionicTests \

bionic-unit-tests-static_static_libraries := \
    libstlport \
    bionic_libm_a \
    bionic \
    bionic_libstdc++_so \
    libcxx \
    libcxxabi \
    gtest

bionic-unit-tests-static_force_static_executable := true

LIBS += $(bionic-unit-tests-static_static_libraries) $(bionic-unit-tests-static_whole_static_libraries)

module := bionic-unit-tests-static
module_tag := optional
build_type := target
build_target := NATIVE_TEST

include $(REP_DIR)/lib/mk/libBionicTestAndroidbuild.inc

INC_DIR += $(LOCAL_C_INCLUDES)

CC_OPT 	+= 	$(LOCAL_CFLAGS) \
		-D__ANDROID__ -D__linux__ -D_GNU_SOURCE
CC_C_OPT += $(LOCAL_CONLYFLAGS)
CC_CXX_OPT += $(LOCAL_CPPFLAGS)


SRC_CC += $(LOCAL_SRC_FILES)

vpath %.cpp $(LOCAL_PATH)/
