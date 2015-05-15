
#include $(CLEAR_VARS)

LOCAL_MODULE := $(module)
LOCAL_MODULE_TAGS := $(module_tag)
ifeq ($(build_type),host)
LOCAL_MULTILIB := both
endif


#LOCAL_CLANG := $($(module)_clang_$(build_type))

LOCAL_FORCE_STATIC_EXECUTABLE := $($(module)_force_static_executable)

LOCAL_CFLAGS := \
    $(common_cflags) \
    $($(module)_cflags) \
    $($(module)_cflags_$(build_type)) \

LOCAL_CONLYFLAGS += \
    $(common_conlyflags) \
    $($(module)_conlyflags) \
    $($(module)_conlyflags_$(build_type)) \

LOCAL_CPPFLAGS += \
    $(common_cppflags) \
    $($(module)_cppflags) \
    $($(module)_cppflags_$(build_type)) \

LOCAL_C_INCLUDES := \
    $(common_c_includes) \
    $($(module)_c_includes) \
    $($(module)_c_includes_$(build_type)) \

LOCAL_SRC_FILES := \
    $($(module)_src_files) \
    $($(module)_src_files_$(build_type)) \

LOCAL_STATIC_LIBRARIES := \
    $($(module)_static_libraries) \
    $($(module)_static_libraries_$(build_type)) \

LOCAL_SHARED_LIBRARIES := \
    $($(module)_shared_libraries) \
    $($(module)_shared_libraries_$(build_type)) \

LOCAL_WHOLE_STATIC_LIBRARIES := \
    $($(module)_whole_static_libraries) \
    $($(module)_whole_static_libraries_$(build_type)) \

LOCAL_LDFLAGS := \
    $($(module)_ldflags) \
    $($(module)_ldflags_$(build_type)) \

LOCAL_LDLIBS := \
    $($(module)_ldlibs) \
    $($(module)_ldlibs_$(build_type)) \

