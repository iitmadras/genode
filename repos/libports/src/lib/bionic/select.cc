/*
 * \brief  select() implementation
 * \author Christian Prochaska
 * \author Paramesh O(IITM)
 * \date   2015-05-07
 *
 * the 'select()' implementation is partially based on the lwip version as
 * implemented in 'src/api/sockets.c'
 */

/*
 * Copyright (C) 2010-2013 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#include <base/printf.h>
#include <os/timed_semaphore.h>

#include <plugin_registry.h>
#include <plugin.h>

#include <sys/select.h>
#include <signal.h>

using namespace Libc;



extern "C" int
__attribute__((weak))
__pselect6(int nfds, fd_set *readfds, fd_set *writefds,
       fd_set *exceptfds, const struct timespec *timeout,
       const sigset_t *sigmask)
{
	struct timeval tv;
	sigset_t origmask;
	int nready;

	if (timeout) {
		tv.tv_usec = timeout->tv_nsec / 1000;
		tv.tv_sec = timeout->tv_sec;
	}

	if (sigmask)
		sigprocmask(SIG_SETMASK, sigmask, &origmask);
	nready = select(nfds, readfds, writefds, exceptfds, &tv);
	if (sigmask)
		sigprocmask(SIG_SETMASK, &origmask, NULL);

	return nready;
}
