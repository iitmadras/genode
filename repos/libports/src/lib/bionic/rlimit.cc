/*
 * \brief  C-library back end
 * \author Norman Feske
 * \author Paramesh O(IITM)
 * \date   2015-05-07

 */

/*
 * Copyright (C) 2008-2013 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#include <sys/time.h>
#include <sys/resource.h>
#include <stdio.h>

#include "libc_debug.h"

extern "C" int __attribute__((weak)) getrlimit(int resource, struct rlimit *rlim)
{
	/*
	 * The pthread init code on Linux calls getrlimit
	 * for resource 3 (RLIMIT_STACK). In this case, we
	 * return unlimited.
	 */
	if (resource == 3) {
		rlim->rlim_cur = ~0;
		rlim->rlim_max = ~0;
		return 0;
	}

	raw_write_str("getrlimit called, return 0\n");
	return 0;
}

