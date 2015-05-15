#
# author :paramesh
#


TARGET = test-libcxxabi


LIBS   = libcxxabi libcxx libunwind bionic

LIBCXXABI_DIR := $(call select_from_ports,libcxxabi)
CXX_DIR      := $(LIBCXXABI_DIR)/src/lib/libcxx/test



SRC_CC += main.cc
 

vpath main.cc $(PRG_DIR)/..
