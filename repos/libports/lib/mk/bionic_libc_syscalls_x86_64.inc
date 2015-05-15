BIONIC_PORT_DIR := $(call select_from_ports,bionic)
BIONIC_DIR      := $(BIONIC_PORT_DIR)/src/lib/bionic
LOCAL_PATH     := $(BIONIC_DIR)/libc

# x86_64 specific configs


libc_common_src_files_x86_64 := \
     memchr.c \
     memrchr.c \
     strnlen.c \
     wcscat.c \
     wcschr.c \
     wcscmp.c \
     wcscpy.c \
     wcslen.c \
     wcsrchr.c \
     wmemcmp.c \
     wmemmove.c \
     strlcat.c \
     strlcpy.c \
    


      

# Fortify implementations of libc functions.
libc_common_src_files_x86_64_CPP += \
     strchr.cpp \
     strrchr.cpp \
     __memcpy_chk.cpp \
     __memset_chk.cpp \
     __strcpy_chk.cpp \
     __strcat_chk.cpp \



##########################################
### CPU specific source files
libc_bionic_src_files_x86_64 := \
     __bionic_clone.S \
     _exit_with_stack_teardown.S \
     __get_sp.S \
     __rt_sigreturn.S \
     syscall.S \
     _setjmp.S \
     setjmp.S \
     sigsetjmp.S \
    
    
libc_bionic_src_files_x86_64_c :=  \
	     __set_tls.c \

libc_bionic_src_files_x86_64 += \
    sse2-memcpy-slm.S \
     sse2-memmove-slm.S \
     sse2-memset-slm.S \
     sse2-stpcpy-slm.S \
     sse2-stpncpy-slm.S \
     sse2-strcat-slm.S \
     sse2-strcpy-slm.S \
     sse2-strlen-slm.S \
     sse2-strncat-slm.S \
     sse2-strncpy-slm.S \
     sse4-memcmp-slm.S \
     ssse3-strcmp-slm.S \
     ssse3-strncmp-slm.S \
    
    
   
CC_OPT = -fPIC
vpath % $(LOCAL_PATH)/bionic
vpath % $(LOCAL_PATH)/upstream-freebsd/lib/libc/string/
vpath % $(LOCAL_PATH)/upstream-openbsd/lib/libc/string/
vpath % $(LOCAL_PATH)/arch-x86_64/bionic/
 vpath % $(LOCAL_PATH)/arch-x86_64/string/
