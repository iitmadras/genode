#LOCAL_MODULE := libstlport
##########################################
include $(REP_DIR)/lib/mk/libstlport_common.inc

LIBS += libunwindbacktrace \
	bionic  \
	bionic_libm_a \
	bionic_libc_libc_so

SRC_CC += $(libstlport_src_files)
SRC_C += $(libstlport_src_files_c)
CC_OPT += $(libstlport_cflags)
CC_CXX_OPT += $(libstlport_cppflags)
INC_DIR += $(libstlport_c_includes)

vpath %.cpp $(LOCAL_PATH)
vpath %.c $(LOCAL_PATH)

SHARED_LIB = yes
