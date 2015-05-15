include $(REP_DIR)/lib/mk/libunwind_common.inc
#-----------------------------------------------------------------------
# libunwind-ptrace shared library
#-----------------------------------------------------------------------
libunwind-ptrace_src_files := \
	src/ptrace/_UPT_elf.c \
	src/ptrace/_UPT_accessors.c \
	src/ptrace/_UPT_access_fpreg.c \
	src/ptrace/_UPT_access_mem.c \
	src/ptrace/_UPT_access_reg.c \
	src/ptrace/_UPT_create.c \
	src/ptrace/_UPT_destroy.c \
	src/ptrace/_UPT_find_proc_info.c \
	src/ptrace/_UPT_get_dyn_info_list_addr.c \
	src/ptrace/_UPT_put_unwind_info.c \
	src/ptrace/_UPT_get_proc_name.c \
	src/ptrace/_UPT_reg_offset.c \
	src/ptrace/_UPT_resume.c \

libunwind-ptrace_shared_libraries := \
	libunwind \

libunwind-ptrace_ldflags_host := \
	-nostdlib

libunwind-ptrace_ldlibs_host := \
	-lc \
	-lpthread \

ifeq ($(debug),true)
libunwind-ptrace_shared_libraries += \
	liblog \

endif

module := libunwind-ptrace
module_tag := optional
#build_type := target
#build_target := SHARED_LIBRARY
#include $(LOCAL_PATH)/Android.build.mk
build_type := host
#include $(LOCAL_PATH)/Android.build.mk
include $(REP_DIR)/lib/mk/libunwind_build.inc

LIBS += libunwindbacktrace bionic $(LOCAL_STATIC_LIBRARIES) $(LOCAL_WHOLE_STATIC_LIBRARIES) $(LOCAL_SHARED_LIBRARIES)
INC_DIR += $(LOCAL_C_INCLUDES)  $(LOCAL_C_INCLUDES_x86_64)

CC_LD_OPT = $(LOCAL_LDFLAGS)
CC_OPT = $(LOCAL_CFLAGS)
CC_C_OPT = $(LOCAL_CONLYFLAGS)
CC_CXX_OPT = $(LOCAL_CPPFLAGS)

#$(LOCAL_SRC_FILES_x86_64)
SRC_C = $(LOCAL_SRC_FILES)  $(LOCAL_SRC_FILES_x86_64)
SRC_S = $(libunwind_src_files_x86_64_s) 

vpath %.c $(LOCAL_PATH)/
vpath %.S $(LOCAL_PATH)/
SHARED_LIB = yes
