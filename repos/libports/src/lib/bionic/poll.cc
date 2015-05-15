/*
 * \brief  poll() implementation
 * \author Josef Soentgen
 * \author Paramesh O(IITM)
 * \date   2015-05-07
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
#include <sys/poll.h>
#include <stdlib.h>

using namespace Libc;

extern "C" int
__attribute__((weak))
__ppoll(struct pollfd fds[], nfds_t nfds, int timeout)
{
	nfds_t i;
	int saved_errno, ret, fd, maxfd = 0;
	fd_set readfds, writefds, exceptfds;
	struct timeval tv, *tvp = NULL;

	for (i = 0; i < nfds; i++) {
		fd = fds[i].fd;
		if (fd >= FD_SETSIZE) {
			/*errno = EINVAL;*/
			return -1;
		}
		maxfd = maxfd> fd? maxfd :fd;
	}

	/* populate event bit vectors for the events we're interested in */
	for (i = 0; i < nfds; i++) {
		fd = fds[i].fd;
		if (fd == -1)
			continue;
		if (fds[i].events & POLLIN) {
			FD_SET(fd, &readfds);
			FD_SET(fd, &exceptfds);
		}
		if (fds[i].events & POLLOUT) {
			FD_SET(fd, &writefds);
			FD_SET(fd, &exceptfds);
		}
	}

	/* poll timeout is msec, select is timeval (sec + usec) */
	if (timeout >= 0) {
		tv.tv_sec = timeout / 1000;
		tv.tv_usec = (timeout % 1000) * 1000;
		tvp = &tv;
	}
	ret = select(maxfd + 1, &readfds, &writefds, &exceptfds, tvp);
	saved_errno = errno;
	/* scan through select results and set poll() flags */
	for (i = 0; i < nfds; i++) {
		fd = fds[i].fd;
		fds[i].revents = 0;
		if (fd == -1)
			continue;
		if (FD_ISSET(fd, &readfds)) {
			fds[i].revents |= POLLIN;
		}
		if (FD_ISSET(fd, &writefds)) {
			fds[i].revents |= POLLOUT;
		}
		if (FD_ISSET(fd, &exceptfds)) {
			fds[i].revents |= POLLERR;
		}
	}

	
	if (ret == -1)
		errno = saved_errno;
	
	return ret;
}
