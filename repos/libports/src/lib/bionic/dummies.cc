/*
 * \brief  Dummy implementations
 * \author Norman Feske
 * \author Paramesh O(IITM)
 * \date   2010-05-07
 */

/*
 * Copyright (C) 2008-2013 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#include <base/printf.h>
#include <stddef.h>
#include <errno.h>
#include <base/env.h>

extern "C" {

	typedef long DUMMY;

#define DUMMY(retval, name) __attribute__((weak))		\
DUMMY name(void) {						\
	PDBG( #name " called, not implemented");		\
	errno = ENOSYS;						\
	return retval;						\
}

DUMMY(0, abort)
DUMMY(-1, statfs)

DUMMY(0, epoll_create1)
DUMMY(0, inotify_init1)

DUMMY(0, fstatat)
DUMMY(0, __getpid)
DUMMY(0, memmove)
DUMMY(0, syscall)
DUMMY(0, faccessat)

DUMMY(0, sched_getparam)
DUMMY(0, times)
DUMMY(0, __sched_getaffinity)
DUMMY(0, __set_tid_address)
DUMMY(0, dup3)
DUMMY(0, setpriority)
DUMMY(0, __getcwd)
DUMMY(0, __rt_sigsuspend)
DUMMY(0, __waitid)

DUMMY(0, utimensat)
DUMMY(0, prctl)
DUMMY(0, __signalfd4)

DUMMY(0, setitimer)
DUMMY(0, renameat)
DUMMY(0, getuid)
DUMMY(0, sched_setscheduler)

DUMMY(0, __arch_prctl)


DUMMY(0, sched_getscheduler)
DUMMY(0, clock_getres)
DUMMY(0, sigaltstack)
DUMMY(0, fstatfs)
DUMMY(0, setgroups)
DUMMY(0, __getcpu)
DUMMY(0, __timer_getoverrun)
DUMMY(0, ftruncate)

DUMMY(0, _Exit) 
DUMMY(0, setpgid)
DUMMY(0, __reboot)
DUMMY(0, uname)

DUMMY(0, wait4)
DUMMY(0, __epoll_pwait)
DUMMY(0, __timer_settime)
DUMMY(0, kill)
DUMMY(0, unlinkat)
DUMMY(0, __rt_sigpending)
DUMMY(0, umount2)

DUMMY(0, tgkill)
DUMMY(0, mincore)
DUMMY(0, umask)
DUMMY(0, __getpriority)
DUMMY(0, fallocate)
DUMMY(0, __rt_sigreturn)
DUMMY(0, __brk)
DUMMY(0, setresuid)
DUMMY(0, __get_sp)
DUMMY(0, mkdirat)
DUMMY(0, __ptrace)
DUMMY(0, fchownat)
DUMMY(0, __timer_delete)
DUMMY(0, fallocate64)
DUMMY(0, _exit_with_stack_teardown)
DUMMY(0, __timer_gettime)
DUMMY(0, linkat)
DUMMY(0, fchmodat)
DUMMY(0, getpeername)
DUMMY(0, __timer_create)
DUMMY(0, socketpair)
DUMMY(0, setresgid)
DUMMY(0, __rt_sigaction)
DUMMY(0, __bionic_clone)
DUMMY(0, symlinkat)
DUMMY(0, mknodat)
DUMMY(0, readlinkat)
DUMMY(0, __openat)
DUMMY(0, __accept4)
DUMMY(0, __pselect6)
DUMMY(0, __getdents64)
DUMMY(0, __rt_sigprocmask)
DUMMY(0, setsid)
DUMMY(0, getpgid)
DUMMY(0, __rt_sigtimedwait)
DUMMY(0, msync)
DUMMY(0, _Unwind_Backtrace)
DUMMY(0, _Unwind_GetIP)
void ksem_init(void)
{
	PDBG("ksem_init called, not yet implemented!");
	while (1);
}

int mprotect(const void*, size_t, int){
	return 0;
}

} /* extern "C" */

void* memset(void *dst, int i, size_t size){
    while (size--) ((char *)dst)[size] = i;
		return dst;
}


