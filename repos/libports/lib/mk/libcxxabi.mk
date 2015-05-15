

LIBCXXABI_PORT_DIR := $(call select_from_ports,libcxxabi)
LOCAL_PATH := $(LIBCXXABI_PORT_DIR)/src/lib/libcxxabi

BIONIC_DIR := $(call select_from_ports,bionic)

LIBCXX_DIR := $(call select_from_ports,libcxx)

LIBCXXABI_SRC_FILES := \
	src/abort_message.cpp \
	src/cxa_aux_runtime.cpp \
	src/cxa_exception.cpp \
	src/cxa_exception_storage.cpp \
	src/cxa_guard.cpp \
	src/cxa_new_delete.cpp \
	src/cxa_personality.cpp \
	src/cxa_unexpected.cpp \
	src/cxa_vector.cpp \
	src/cxa_virtual.cpp \
	src/exception.cpp \
	src/private_typeinfo.cpp \
	src/stdexcept.cpp \
	src/typeinfo.cpp \
	src/cxa_handlers.cpp \
	src/cxa_default_handlers.cpp \
	src/cxa_demangle.cpp \
	#src/fallback_malloc.cpp \
	

LLVM_UNWIND_SRC_FILES := \
	src/Unwind/libunwind.cpp \
	src/Unwind/Unwind-EHABI.cpp \
	src/Unwind/Unwind-sjlj.c \
	src/Unwind/UnwindLevel1-gcc-ext.c \
	src/Unwind/UnwindLevel1.c \
	src/Unwind/UnwindRegistersSave.S \
	src/Unwind/UnwindRegistersRestore.S \

LIBCXXABI_CFLAGS := \
	-I$(LOCAL_PATH)/include/ \
	-I$(BIONIC_DIR)/include/ \
	-I$(LIBCXX_DIR)/src/ \
	

LIBCXXABI_RTTI_FLAG := -frtti
LIBCXXABI_CPPFLAGS := \
	-I$(LIBCXX_DIR)/include/ \
	-std=c++11 \
	-fexceptions \

INC_DIR += $(LIBCXX_DIR)/include/
INC_DIR += $(LIBCXX_DIR)/src/

LIBS += libunwind libunwindbacktrace bionic


CC_OPT = $(LIBCXXABI_CFLAGS) $(LIBCXXABI_RTTI_FLAG)
CC_CXX_OPT = $(LIBCXXABI_CPPFLAGS)

SRC_CC = $(LIBCXXABI_SRC_FILES)

vpath %.cpp $(LOCAL_PATH)


