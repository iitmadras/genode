LIBUNWIND_PORT_DIR := $(call select_from_ports,libunwind)

#
# Add generic libc headers to standard include search paths
#
INC_DIR += $(LIBUNWIND_PORT_DIR)/include/
