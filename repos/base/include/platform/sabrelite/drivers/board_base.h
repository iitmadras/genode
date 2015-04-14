/*
 * \brief  Board definitions for specific for SABRE Lite
 * \author Nikolay Golikov <nik@ksyslabs.org>
 * \author Josef Soentgen
 * \author Martin Stein
 * \author Praveen Srinivas (IIT Madras, India)
 * \date   2014-02-25
 */

/*
 * Copyright (C) 2014-2015 Ksys Labs LLC
 * Copyright (C) 2014-2015 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#ifndef _SABRELITE__DRIVERS__BOARD_BASE_H_
#define _SABRELITE__DRIVERS__BOARD_BASE_H_

/* Genode includes */
#include <platform/imx6/drivers/board_base.h>

namespace Genode
{
	/**
	 * Motherboard
	 */
	struct Board_base;
}

struct Genode::Board_base : Imx6::Board_base
{
	enum {
		/* normal RAM */
		RAM0_BASE = 0x30000000,
		RAM0_SIZE = 0x20000000,

		/* UART */
		UART_1_IRQ       = 57,
		UART_1_MMIO_BASE = 0x021e8000,
		UART_1_MMIO_SIZE = 0x00004000,
	};
};

#endif /* _SABRELITE__DRIVERS__BOARD_BASE_H_ */
