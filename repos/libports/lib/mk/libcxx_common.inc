LIBCXX_PORT_DIR := $(call select_from_ports,libcxx)
LOCAL_PATH := $(LIBCXX_PORT_DIR)/src/lib/libcxx

LIBCXX_SRC_FILES := \
	src/algorithm.cpp \
	src/bind.cpp \
	src/chrono.cpp \
	src/condition_variable.cpp \
	src/debug.cpp \
	src/exception.cpp \
	src/future.cpp \
	src/hash.cpp \
	src/ios.cpp \
	src/iostream.cpp \
	src/locale.cpp \
	src/memory.cpp \
	src/mutex.cpp \
	src/new.cpp \
	src/optional.cpp \
	src/random.cpp \
	src/regex.cpp \
	src/shared_mutex.cpp \
	src/stdexcept.cpp \
	src/string.cpp \
	src/strstream.cpp \
	src/system_error.cpp \
	src/thread.cpp \
	src/typeinfo.cpp \
	src/utility.cpp \
	src/valarray.cpp \
	
	
	

LIBCXX_C_INCLUDES := \
	-I$(LOCAL_PATH)/include/ \
	-D__ANDROID__ \
	-D__linux__

LIBCXX_CPPFLAGS := \
	-std=c++11 \
	-nostdinc++ \
	-fexceptions \
