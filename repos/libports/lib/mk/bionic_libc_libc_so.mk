include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

LIBS += binoic_libc_common
LIBS += bionic_libdl


CC_OPT := $(libc_common_cflags) \
	-fPIC \
	
CC_C_OPT := $(libc_common_conlyflags)
CC_CXX_OPT := $(libc_common_cppflags)


SRC_CC += \
    $(libc_arch_dynamic_src_files) \
    $(libc_static_common_src_files) \
      NetdClient.cpp \
     debug_mapinfo.cpp \
     malloc_debug_common.cpp \
     debug_stacktrace.cpp \
 
LOCAL_LDFLAGS_x86_64 := -Wl,--exclude-libs,libgcc.a
LD_OPT += $(LOCAL_LDFLAGS_X86_64)    
SHARED_LIB =yes

vpath %.cpp $(LOCAL_PATH)/bionic

