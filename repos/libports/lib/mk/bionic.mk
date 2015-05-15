include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

CC_OPT = -fPIC -nostdinc

LIBS += base config


LIBS += binoic_libc_common

## libstdc++ --> bionic_libstdc++_so
LIBS += bionic_libstdc++_so

## libm --> bionic_libm_so.lib.so 
LIBS += bionic_libm_so



SRC_CC += \
     debug_mapinfo.cpp \
     debug_stacktrace.cpp \




## bionic libc backend includes
INC_DIR += $(REP_DIR)/include/bionic-plugin
INC_DIR += $(REP_DIR)/src/lib/bionic

## backend code    
SRC_CC += clock_gettime.cc dummies.cc exit.cc\
         errno.cc fd_alloc.cc file_operations.cc \
         gettimeofday.cc libc_mem_alloc.cc  malloc.cc nanosleep.cc \
         plugin.cc plugin_registry.cc  pread_pwrite.cc poll.cc \
        rlimit.cc  readv_writev.cc rtc.cc select.cc \
          vfs_plugin.cc  gai_strerror.cc \
          

		

    
vpath %.cpp $(LOCAL_PATH)/bionic
vpath %.c $(BIONIC_DIR)/
vpath %.cc  $(REP_DIR)/src/lib/bionic

SHARED_LIB = yes

