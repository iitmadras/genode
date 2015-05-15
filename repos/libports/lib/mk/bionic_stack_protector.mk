include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc


CC_OPT = $(libc_common_cflags) -fno-stack-protector -fPIC
CC_C_OPT = $(libc_common_conlyflags)
CC_CXX_OPT = $(libc_common_cppflags)

SRC_CC = __stack_chk_fail.cpp

vpath %.cpp $(LOCAL_PATH)/bionic/
