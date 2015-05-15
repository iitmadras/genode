include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

LIBS += bionic_libdl
LIBS += bionic_libc_libc_so
#LIBS += binoic_libc_common

CC_OPT := \
    $(libc_common_cflags) \
    -DMALLOC_LEAK_CHECK \
    -fPIC

CC_C_OPT := $(libc_common_conlyflags)
CC_CXX_OPT := $(libc_common_cppflags)


SRC_CC = \
     libc_logging.cpp \
     debug_mapinfo.cpp \
     malloc_debug_check.cpp \
     malloc_debug_leak.cpp \
     debug_stacktrace.cpp \


SHARED_LIB =yes

vpath %.cpp $(LOCAL_PATH)/bionic


