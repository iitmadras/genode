
HOST_OS = linux
LOCAL_LDFLAGS := -nodefaultlibs
LOCAL_LDLIBS := -lc

LOCAL_MULTILIB := both

ifeq ($(HOST_OS), darwin)
LOCAL_LDFLAGS += \
            -Wl,-unexported_symbols_list,external/libcxx/lib/libc++unexp.exp  \
            -Wl,-force_symbols_not_weak_list,external/libcxx/lib/notweak.exp \
            -Wl,-force_symbols_weak_list,external/libcxx/lib/weak.exp
else
LOCAL_LDLIBS += -lrt -lpthread -ldl -lm
endif

LIBS += libcxx_a 

CC_OPT += -Xlinker $(LOCAL_LDFLAGS)

SHARED_LIB = yes
