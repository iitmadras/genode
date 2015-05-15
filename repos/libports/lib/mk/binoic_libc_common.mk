include $(REP_DIR)/lib/mk/bionic_libc_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

LIBS += \
    bionic_libc_bionic \
     bionic_libc_dns \
     bionic_libc_freebsd \
     bionic_libc_gdtoa \
     bionic_libc_netbsd \
     bionic_libc_openbsd \
     bionic_stack_protector \
     bionic_libc_tzcode \
     bionic_libc_malloc \

CC_OPT += $(libc_common_cflags) -DPIC

CC_C_OPT += $(libc_common_conlyflags)
CC_CXX_OPT += $(libc_common_cppflags)

SRC_C += $(libc_common_src_files)
SRC_CC +=$(libc_common_cpp_src_files)


vpath % $(LOCAL_PATH)/bionic

