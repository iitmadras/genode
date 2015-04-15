/*
 * \brief  Testing 'TrustZone Secure region access' 
 * \author Chirag Garg (IIT Madras, India)
 * \date   2012-04-20
 *
 */

/*
 * Copyright (C) 2012-2013 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#include <base/printf.h>
#include <base/env.h>
#include <io_mem_session/connection.h>
#include <sc_ram.h>

int main(int argc, char **argv)
{
	
	using namespace Genode;
	
	Genode::printf("-1 = %d = %ld\n", -1, -1L);
	
	Genode::Io_mem_connection _ram_iomem(0x20000000,0x10000000);
	Sc_ram  _ram((addr_t)env()->rm_session()->attach(_ram_iomem.dataspace()));
	
	
	_ram.access_secure_region();
	
	return 0;
}
