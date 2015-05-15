include $(REP_DIR)/lib/mk/bionic_libm_src.inc
include $(REP_DIR)/lib/mk/bionic_libc_includes.inc

LIBS += bionic_libc_libc_so
LIBS += bionic_libm_a

SHARED_LIB =yes
