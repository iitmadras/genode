BIONIC_PORT_DIR := $(call select_from_ports,bionic)
BIONIC_DIR      := $(BIONIC_PORT_DIR)/src/lib/bionic
GTEST_PORT_DIR := $(call select_from_ports,gtest)


TARGET = test-bionic 

CC_OPT += -nostdinc 

LIBS += bionic


SRC_CC += temp.cc

vpath temp.cc $(PRG_DIR)/

