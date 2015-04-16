/*
 * \brief  Testing 'switch_nw_sw()' 
 * \author Chirag Garg(IIT Madras, India)
 * \date   2015-04-14
 *
 */

/*
 * Copyright (C) 2012-2013 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#include <kernel/interface.h> 
#include <base/printf.h>
#include <base/env.h>
#include <cpu/cpu_state.h>
struct Switch : Genode::Cpu_state_modes
{
  	
};


int main(int argc, char **argv)
{
	
	using namespace Genode;
	Switch *sw;
	Genode::printf("-1 = %d = %ld\n", -1, -1L);	
	
	PERR("SMC call .. ");
	Kernel::switch_nw_sw(0x10000);
	PERR("3rd SMC call .. ");
	Kernel::switch_nw_sw_arg(0x10000,0x500);	
  	//Genode::printf("value from secure world = %lx ",sw->r0);	
	PERR("After the smc call ..");
	return 0;
}
