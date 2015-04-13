/*
 * \brief  TrustZone specific definitions for the i.MX6 board
 * \author Stefan Kalkowski
 * \date   2013-11-15
 */

/*
 * Copyright (C) 2013 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#ifndef _INCLUDE__PLATFORM__IMX6__DRIVERS__TRUSTZONE_H_
#define _INCLUDE__PLATFORM__IMX6__DRIVERS__TRUSTZONE_H_

/* Genode includes */
#include <drivers/board_base.h>

namespace Trustzone
{
	enum {
		/**
		 * Currently, we limit secure RAM to 512 MB only,
		 * devloper can modify this RAM according to his need
		 */
		SECURE_RAM_BASE    = Genode::Board_base::RAM0_BASE,
		SECURE_RAM_SIZE    = Genode::Board_base::RAM0_SIZE,
		NONSECURE_RAM_BASE = Genode::Board_base::RAM1_BASE,
		NONSECURE_RAM_SIZE = Genode::Board_base::RAM1_SIZE,
	};
}

#endif /* _INCLUDE__PLATFORM__IMX6__DRIVERS__TRUSTZONE_H_ */

