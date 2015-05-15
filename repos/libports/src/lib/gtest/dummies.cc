
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

DUMMY(0, __emutls_get_address);
}


