/*
 * \brief  C-library back end
 * \author Norman Feske
 * \author Paramesh O(IITM)
 * \date   2015-05-07
 *
 * Note: this version not thread safe
 */

/*
 * Copyright (C) 2008-2013 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

static int private_errno;


extern "C" volatile int*  __errno()
{
	return &private_errno;
}
