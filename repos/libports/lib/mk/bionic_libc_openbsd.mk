include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc


LIBS += base


LOCAL_CFLAGS := \
    -Wno-sign-compare \
    -Wno-uninitialized \
    -Wno-unused-parameter \
    -I$(LOCAL_PATH)/private \
    -I$(LOCAL_PATH)/upstream-openbsd/android/include \
    -I$(LOCAL_PATH)/upstream-openbsd/lib/libc/include \
    -I$(LOCAL_PATH)/upstream-openbsd/lib/libc/gdtoa/ \
    -include openbsd-compat.h \
    -fPIC \
    $(libc_common_cflags) \

LOCAL_CONLYFLAGS := $(libc_common_conlyflags) 
LOCAL_CPPFLAGS := $(libc_common_cppflags)
    
CC_OPT = $(LOCAL_CFLAGS)
CC_C_OPT = $(LOCAL_CONLYFLAGS)
CC_CXX_OPT = $(LOCAL_CPPFLAGS)


SRC_C = $(libc_upstream_openbsd_src_files) \
	bcopy.c strcpy.c stpncpy.c strcasecmp.c strcat.c \
	strcmp.c strcpy.c strcspn.c strdup.c \
	strlen.c strncat.c strncmp.c strcpy.c \
	strndup.c strpbrk.c strsep.c strspn.c strstr.c strtok.c \
	wcslcpy.c wcsstr.c wcswidth.c strncpy.c stpcpy.c
	
SRC_CC += $(libc_upstream_openbsd_src_cpp_files)

vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/gdtoa/
vpath % $(LOCAL_PATH)/upstream-openbsd/android/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/gen/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/locale/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/net/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/stdio/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/stdlib/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/string/


