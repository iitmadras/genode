BIONIC_PORT_DIR := $(call select_from_ports,bionic)
BIONIC_DIR      := $(BIONIC_PORT_DIR)/src/lib/bionic

LOCAL_PATH := $(BIONIC_DIR)/libc
TARGET_ARCH := x86
TARGET_2ND_ARCH := x86_64

# Define the common source files for all the libc instances
# =========================================================
libc_common_src_files := \
     arc4random.c \
     bindresvport.c \
     daemon.c \
     err.c \
     ether_aton.c \
     ether_ntoa.c \
     fts.c \
     gethostname.c \
     getpriority.c \
     getpt.c \
     if_indextoname.c \
     if_nametoindex.c \
     initgroups.c \
     isatty.c \
     memmem.c \
     pathconf.c \
     ptsname.c \
     ptsname_r.c \
     pututline.c \
     sched_cpualloc.c \
     sched_cpucount.c \
     semaphore.c \
     sigblock.c \
     siginterrupt.c \
     sigsetmask.c \
     system_properties_compat.c \
     unlockpt.c \
    stdio/snprintf.c\
    stdio/sprintf.c \
    unistd/syslog.c \
    #ioctl.c \
   
# Fortify implementations of libc functions.
libc_common_cpp_src_files := \
 __FD_chk.cpp \
     __fgets_chk.cpp \
     __memmove_chk.cpp \
     __read_chk.cpp \
     __recvfrom_chk.cpp \
     __stpcpy_chk.cpp \
     __stpncpy_chk.cpp \
     __strchr_chk.cpp \
     __strlcat_chk.cpp \
     __strlcpy_chk.cpp \
     __strlen_chk.cpp \
     __strncat_chk.cpp \
     __strncpy_chk.cpp \
     __strrchr_chk.cpp \
     __umask_chk.cpp \
     __vsnprintf_chk.cpp \
     __vsprintf_chk.cpp \
    

libc_bionic_cpp_src_files := \
     abort.cpp \
     accept4.cpp \
     access.cpp \
     assert.cpp \
     atof.cpp \
     __bionic_name_mem.cpp \
     bionic_time_conversions.cpp \
     brk.cpp \
     c16rtomb.cpp \
     c32rtomb.cpp \
     chmod.cpp \
     chown.cpp \
     clearenv.cpp \
     clock.cpp \
     clone.cpp \
     __cmsg_nxthdr.cpp \
     ctype.cpp \
     __cxa_guard.cpp \
     __cxa_pure_virtual.cpp \
     dirent.cpp \
     epoll_create.cpp \
     epoll_pwait.cpp \
     epoll_wait.cpp \
     eventfd_read.cpp \
     eventfd_write.cpp \
     ffs.cpp \
     flockfile.cpp \
     fork.cpp \
     fpclassify.cpp \
     futimens.cpp \
     getauxval.cpp \
     getcwd.cpp \
     getpgrp.cpp \
     getpid.cpp \
     gettid.cpp \
     inotify_init.cpp \
     lchown.cpp \
     lfs64_support.cpp \
     __libc_current_sigrtmax.cpp \
     __libc_current_sigrtmin.cpp \
     libc_init_common.cpp \
     libc_logging.cpp \
     libgen.cpp \
     link.cpp \
     locale.cpp \
     mbrtoc16.cpp \
     mbrtoc32.cpp \
     mbstate.cpp \
     mkfifo.cpp \
     mknod.cpp \
     mntent.cpp \
     NetdClientDispatch.cpp \
     new.cpp \
     pause.cpp \
     poll.cpp \
     posix_fallocate.cpp \
     posix_timers.cpp \
     pthread_atfork.cpp \
     pthread_attr.cpp \
     pthread_cond.cpp \
     pthread_create.cpp \
     pthread_detach.cpp \
     pthread_equal.cpp \
     pthread_exit.cpp \
     pthread_getcpuclockid.cpp \
     pthread_getschedparam.cpp \
     pthread_internals.cpp \
     pthread_join.cpp \
     pthread_key.cpp \
     pthread_kill.cpp \
     pthread_mutex.cpp \
     pthread_once.cpp \
     pthread_rwlock.cpp \
     pthread_self.cpp \
     pthread_setname_np.cpp \
     pthread_setschedparam.cpp \
     pthread_sigmask.cpp \
     ptrace.cpp \
     raise.cpp \
     rand.cpp \
     reboot.cpp \
     scandir.cpp \
     sched_getaffinity.cpp \
     sched_getcpu.cpp \
     setegid.cpp \
     __set_errno.cpp \
     seteuid.cpp \
     setpgrp.cpp \
     sigaction.cpp \
     sigaddset.cpp \
     sigdelset.cpp \
     sigemptyset.cpp \
     sigfillset.cpp \
     sigismember.cpp \
     signal.cpp \
     signalfd.cpp \
     sigpending.cpp \
     sigprocmask.cpp \
     sigsuspend.cpp \
     sigwait.cpp \
     statvfs.cpp \
     strcoll_l.cpp \
     strerror.cpp \
     strerror_r.cpp \
     strftime_l.cpp \
     strsignal.cpp \
     strtold.cpp \
     strtold_l.cpp \
     strtoll_l.cpp \
     strtoull_l.cpp \
     strxfrm_l.cpp \
      sysconf.cpp \
     sys_siglist.c \
     sys_signame.c \
     system_properties.cpp \
     tdestroy.cpp \
     termios.cpp \
     thread_private.cpp \
     tmpfile.cpp \
     umount.cpp \
     utimes.cpp \
     vdso.cpp \
     vfork.cpp \
     wait.cpp \
     wchar.cpp \
     wctype.cpp \
     stubs.cpp \
     #accept.cpp \
     #connect.cpp \
     #dup2.cpp \
     #lstat.cpp \
     #mkdir.cpp \
     #open.cpp \
     #pipe.cpp \
     #readlink.cpp \
     #recv.cpp \
     #rename.cpp \
     #rmdir.cpp \
     #send.cpp \
     #socket.cpp \ 
     #stat.cpp \
     #symlink.cpp \
     #unlink.cpp \  
     #__errno.cpp \
     
        
libc_upstream_freebsd_src_files := \
     ldexp.c \
     sleep.c \
     usleep.c \
     fclose.c \
     flags.c \
     fopen.c \
     abs.c \
     getopt_long.c \
     imaxabs.c \
     imaxdiv.c \
     labs.c \
     llabs.c \
     qsort.c \
     quick_exit.c \
     realpath.c \
     wcpcpy.c \
     wcpncpy.c \
     wcscasecmp.c \
     wcscspn.c \
     wcsdup.c \
     wcslcat.c \
     wcsncasecmp.c \
     wcsncat.c \
     wcsncmp.c \
     wcsncpy.c \
     wcsnlen.c \
     wcspbrk.c \
     wcsspn.c \
     wcstok.c \
     wmemchr.c \
     wmemcpy.c \
     wmemset.c \

libc_upstream_netbsd_src_files := \
     random.c \
     ftw.c \
     nftw.c \
     nice.c \
     popen.c \
     psignal.c \
     utime.c \
     utmp.c \
     nsap_addr.c \
     regcomp.c \
     regerror.c \
     regexec.c \
     regfree.c \
     mtctxres.c \
     bsearch.c \
     div.c \
     drand48.c \
     erand48.c \
     jrand48.c \
     ldiv.c \
     lldiv.c \
     lrand48.c \
     lsearch.c \
     mrand48.c \
     nrand48.c \
     _rand48.c \
     rand_r.c \
     seed48.c \
     srand48.c \
     tdelete.c \
     tfind.c \
     tsearch.c \
     memccpy.c \
     strcasestr.c \
     strcoll.c \
     strxfrm.c \
     killpg.c \
    
libc_upstream_openbsd_gdtoa_src_files := \
     gdtoa_support.cpp \
     dmisc.c \
     dtoa.c \
     gdtoa.c \
     gethex.c \
     gmisc.c \
     hd_init.c \
     hdtoa.c \
     hexnan.c \
     ldtoa.c \
     misc.c \
     smisc.c \
     strtod.c \
     strtodg.c \
     strtof.c \
     strtord.c \
     sum.c \
     ulp.c \
    
libc_upstream_openbsd_gdtoa_cpp_src_files := \
     gdtoa_support.cpp \
     
libc_upstream_openbsd_gdtoa_src_files_32 := \
    $(libc_upstream_openbsd_gdtoa_src_files) \

libc_upstream_openbsd_gdtoa_src_files_64 := \
    $(libc_upstream_openbsd_gdtoa_src_files) \
     strtorQ.c \

libc_upstream_openbsd_src_files := \
     alarm.c \
     ctype_.c \
     exec.c \
     fnmatch.c \
     ftok.c \
     getprogname.c \
     isctype.c \
     setprogname.c \
     time.c \
     tolower_.c \
     toupper_.c \
     btowc.c \
     mbrlen.c \
     mbstowcs.c \
     mbtowc.c \
     wcscoll.c \
     wcstod.c \
     wcstof.c \
     wcstoimax.c \
     wcstol.c \
     wcstold.c \
     wcstoll.c \
     wcstombs.c \
     wcstoul.c \
     wcstoull.c \
     wcstoumax.c \
     wcsxfrm.c \
     wctob.c \
     wctomb.c \
     htonl.c \
     htons.c \
     inet_addr.c \
     inet_lnaof.c \
     inet_makeaddr.c \
     inet_netof.c \
     inet_network.c \
     inet_ntoa.c \
     inet_ntop.c \
     inet_pton.c \
     ntohl.c \
     ntohs.c \
     asprintf.c \
     clrerr.c \
     dprintf.c \
     fdopen.c \
     feof.c \
     ferror.c \
     fflush.c \
     fgetc.c \
     fgetln.c \
     fgetpos.c \
     fgets.c \
     fgetwc.c \
     fgetws.c \
     fileno.c \
     findfp.c \
     fprintf.c \
     fpurge.c \
     fputc.c \
     fputs.c \
     fputwc.c \
     fputws.c \
     fread.c \
     freopen.c \
     fscanf.c \
     fseek.c \
     fsetpos.c \
     ftell.c \
     funopen.c \
     fvwrite.c \
     fwalk.c \
     fwide.c \
     fwprintf.c \
     fwrite.c \
     fwscanf.c \
     getc.c \
     getchar.c \
     getdelim.c \
     getline.c \
     gets.c \
     getwc.c \
     getwchar.c \
     makebuf.c \
     mktemp.c \
     perror.c \
     putc.c \
     putchar.c \
     puts.c \
     putwc.c \
     putwchar.c \
     refill.c \
     remove.c \
     rewind.c \
     rget.c \
     scanf.c \
     setbuf.c \
     setbuffer.c \
     setvbuf.c \
     sscanf.c \
     stdio.c \
     swprintf.c \
     swscanf.c \
     tempnam.c \
     tmpnam.c \
     ungetc.c \
     ungetwc.c \
     vasprintf.c \
     vdprintf.c \
     vfprintf.c \
     vfscanf.c \
     vfwprintf.c \
     vfwscanf.c \
     vprintf.c \
     vscanf.c \
     vsnprintf.c \
     vsprintf.c \
     vsscanf.c \
     vswprintf.c \
     vswscanf.c \
     vwprintf.c \
     vwscanf.c \
     wbuf.c \
     wprintf.c \
     wscanf.c \
     wsetup.c \
     atoi.c \
     atol.c \
     atoll.c \
     getenv.c \
     setenv.c \
     strtoimax.c \
     strtol.c \
     strtoll.c \
     strtoul.c \
     strtoull.c \
     strtoumax.c \
     system.c \
     strcasecmp.c \
     strcspn.c \
     strdup.c \
     strndup.c \
     strpbrk.c \
     strsep.c \
     strspn.c \
     strstr.c \
     strtok.c \
     wcslcpy.c \
     wcsstr.c \
     wcswidth.c \
     printf.c \
     atexit.c \
    #exit.c \
    
    

libc_arch_static_src_files := \
     dl_iterate_phdr_static.cpp \
    
    # Define some common cflags
# ========================================================
libc_common_cflags := \
    -D_LIBC=1 \
    -Wall -Wextra -Wunused \
    -nostdinc \

ifneq ($(TARGET_USES_LOGD),false)
libc_common_cflags += -DTARGET_USES_LOGD
endif

use_clang := false

# Try to catch typical 32-bit assumptions that break with 64-bit pointers.
libc_common_cflags += \
    -Werror=pointer-to-int-cast \
    -Werror=int-to-pointer-cast \
    -Werror=type-limits \
    -Wno-error=missing-braces  \
    -W \
    #-Werror \
    
    
    

ifeq ($(strip $(DEBUG_BIONIC_LIBC)),true)
  libc_common_cflags += -DDEBUG
endif

MALLOC_IMPL = dlmalloc

ifeq ($(MALLOC_IMPL),dlmalloc)
  libc_common_cflags += -DUSE_DLMALLOC
  libc_malloc_src :=  dlmalloc.c
else
  libc_common_cflags += -DUSE_JEMALLOC
  libc_malloc_src :=  jemalloc_wrapper.cpp
endif

# To customize dlmalloc's alignment, set BOARD_MALLOC_ALIGNMENT in
# the appropriate BoardConfig.mk file.
#
ifneq ($(BOARD_MALLOC_ALIGNMENT),)
  libc_common_cflags += -DMALLOC_ALIGNMENT=$(BOARD_MALLOC_ALIGNMENT)
endif

# Define ANDROID_SMP appropriately.
ifeq ($(TARGET_CPU_SMP),true)
    libc_common_cflags += -DANDROID_SMP=1
else
    libc_common_cflags += -DANDROID_SMP=0
endif

# Define some common conlyflags
libc_common_conlyflags := \
    -std=gnu99

# Define some common cppflags
libc_common_cppflags := \
    -std=gnu++11

# Define some common includes
# ========================================================
libc_common_c_includes += \
    $(LOCAL_PATH)/stdio   \

# ========================================================
# Add in the arch-specific flags.
# Must be called with $(eval).
# $(1): the LOCAL_ variable name
# $(2): the bionic variable name to pull in
define patch-up-arch-specific-flags
$(1)_$(TARGET_ARCH) += $($(2)_$(TARGET_ARCH))
ifdef TARGET_2ND_ARCH
$(1)_$(TARGET_2ND_ARCH) += $($(2)_$(TARGET_2ND_ARCH))
endif
endef

vpath %.c $(LOCAL_PATH)/
vpath %.cpp $(LOCAL_PATH)/

include $(call select_from_repositories,lib/import/import-bionic.mk)
