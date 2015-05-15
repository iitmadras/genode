include $(REP_DIR)/lib/mk/libunwind_common.inc


#-----------------------------------------------------------------------
# libunwindbacktrace static library
#-----------------------------------------------------------------------
libunwindbacktrace_src_files += \
	 BacktraceWrapper.c \
	 DeleteException.c \
	 FindEnclosingFunction.c \
	 ForcedUnwind.c \
	 GetBSP.c \
	 GetCFA.c \
	 GetDataRelBase.c \
	 GetGR.c \
	 GetIP.c \
	 GetIPInfo.c \
	 GetLanguageSpecificData.c \
	 GetRegionStart.c \
	 GetTextRelBase.c \
	RaiseException.c \
	 Resume.c \
	 Resume_or_Rethrow.c \
	 SetGR.c \
	 SetIP.c \

libunwindbacktrace_cflags += \
	-Wno-old-style-declaration \
	-fvisibility=hidden \

module := libunwindbacktrace
module_tag := optional

build_target := STATIC_LIBRARY
build_type := host

include $(REP_DIR)/lib/mk/libunwind_build.inc

LIBS +=  libunwind $(LOCAL_STATIC_LIBRARIES) $(LOCAL_WHOLE_STATIC_LIBRARIES) $(LOCAL_SHARED_LIBRARIES) bionic


INC_DIR += $(LOCAL_C_INCLUDES)  $(LOCAL_C_INCLUDES_x86_64)

LD_OPT = $(LOCAL_LDFLAGS)
CC_OPT = $(LOCAL_CFLAGS)  -fPIC
CC_C_OPT = $(LOCAL_CONLYFLAGS)
CC_CXX_OPT = $(LOCAL_CPPFLAGS)

SRC_C = $(LOCAL_SRC_FILES) $(LOCAL_SRC_FILES_x86_64)
SRC_CC = dummies.cc


vpath % $(LOCAL_PATH)/src/unwind 
vpath %.cc $(REP_DIR)/src/lib/libunwind

