include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc
LOCAL_PATH_STD      := $(BIONIC_DIR)/libstdc++

LIBS +=  bionic_libc_libc_so

CC_OPT = -fPIC

SRC_CC = libstdc++.cpp

vpath %.cpp $(LOCAL_PATH_STD)/src/

SHARED_LIB = yes

