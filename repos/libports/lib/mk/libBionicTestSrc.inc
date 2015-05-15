#libBionicTestSrc.inc

BIONIC_PORT_DIR := $(call select_from_ports,bionic)
BIONIC_DIR      := $(BIONIC_PORT_DIR)/src/lib/bionic

LOCAL_PATH = $(BIONIC_DIR)/tests


BIONIC_INCLUDE      := $(BIONIC_PORT_DIR)/include

HOST_OS = linux
HIST_ARCH = x86_64
# -----------------------------------------------------------------------------
# Unit tests.
# -----------------------------------------------------------------------------

ifeq ($(HOST_OS)-$(HOST_ARCH),$(filter $(HOST_OS)-$(HOST_ARCH),linux-x86 linux-x86_64))
build_host := true
else
build_host := false
endif

# -----------------------------------------------------------------------------
# All standard tests.
# -----------------------------------------------------------------------------
test_cflags = \
    -fstack-protector-all \
    -g \
    -Wall -Wextra -Wunused \
    -Werror \
    -fno-builtin \

test_cflags += -D__STDC_LIMIT_MACROS  # For glibc.

MALLOC_IMPL := dlmalloc

ifeq ($(MALLOC_IMPL),dlmalloc)
test_cflags += -DUSE_DLMALLOC
else
test_cflags += -DUSE_JEMALLOC
endif

test_cppflags = \
    -std=gnu++11 \

libBionicStandardTests_src_files := \
    arpa_inet_test.cpp \
    buffer_tests.cpp \
    ctype_test.cpp \
    dirent_test.cpp \
    eventfd_test.cpp \
    fcntl_test.cpp \
    fenv_test.cpp \
    ftw_test.cpp \
    getauxval_test.cpp \
    getcwd_test.cpp \
    inttypes_test.cpp \
    libc_logging_test.cpp \
    libgen_test.cpp \
    locale_test.cpp \
    malloc_test.cpp \
    math_cos_test.cpp \
    math_cosf_test.cpp \
    math_exp_test.cpp \
    math_expf_test.cpp \
    math_log_test.cpp \
    math_logf_test.cpp \
    math_pow_test.cpp \
    math_powf_test.cpp \
    math_sin_test.cpp \
    math_sinf_test.cpp \
    math_sincos_test.cpp \
    math_sincosf_test.cpp \
    math_tan_test.cpp \
    math_tanf_test.cpp \
    math_test.cpp \
    mntent_test.cpp \
    netdb_test.cpp \
    pthread_test.cpp \
    regex_test.cpp \
    sched_test.cpp \
    signal_test.cpp \
    stack_protector_test.cpp \
    stack_unwinding_test.cpp \
    stdatomic_test.cpp \
    stdint_test.cpp \
    stdio_test.cpp \
    stdlib_test.cpp \
    string_test.cpp \
    sstream_test.cpp \
    strings_test.cpp \
    stubs_test.cpp \
    sys_epoll_test.cpp \
    sys_mman_test.cpp \
    sys_resource_test.cpp \
    sys_select_test.cpp \
    sys_sendfile_test.cpp \
    sys_socket_test.cpp \
    sys_stat_test.cpp \
    sys_statvfs_test.cpp \
    sys_syscall_test.cpp \
    sys_time_test.cpp \
    sys_types_test.cpp \
    sys_vfs_test.cpp \
    system_properties_test.cpp \
    time_test.cpp \
    uchar_test.cpp \
    unistd_test.cpp \
    wchar_test.cpp \
    
vpath %.cpp $(LOCAL_PATH)/
INC_DIR += $(BIONIC_INCLUDE)

