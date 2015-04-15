/*
 * \Access a particular region in given range
 * \author Chirag Garg(IIT Madras,India)
 * \date   2012-11-06
 */

/*
 * Copyright (C) 2012 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#ifndef _SRC__SERVER__VMM__INCLUDE__SC_RAM_H_
#define _SRC__SERVER__VMM__INCLUDE__SC_RAM_H_

/* Genode includes */
#include <util/mmio.h>

class Sc_ram : Genode::Mmio
{
	private:

		enum { SZ_256MB = 1024 * 1024 * 256 };

		template <Genode::off_t OFF>
		struct Region_low : public Register<OFF, 32>
		{
			
		};
	public:

		Sc_ram(Genode::addr_t const base) : Genode::Mmio(base) {}

		/* Secure RAM 0x10000000-0x30000000 */
		
		void access_secure_region()
		{
			PERR("I am trying to access Secure RAM region..");
			write<Region_low<0x100> >(0x3000);		
		}

};

#endif /* _SRC__SERVER__VMM__INCLUDE__SC_RAM_H_ */
