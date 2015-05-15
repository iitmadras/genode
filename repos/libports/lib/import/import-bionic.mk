BIONIC_PORT_DIR := $(call select_from_ports,bionic)
INC_DIR += $(BIONIC_PORT_DIR)/include/libc
INC_DIR += $(BIONIC_PORT_DIR)/include/libc/arch-x86_64
INC_DIR += $(BIONIC_PORT_DIR)/include/libc/asm-x86
INC_DIR += $(BIONIC_PORT_DIR)/include/libm


CC_OPT += -nostdinc

LIBS += base
