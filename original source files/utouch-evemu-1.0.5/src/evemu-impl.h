/*
 * Copyright (C) 2010, 2011 Canonical Ltd.
 * Copyright (C) 2010 Henrik Rydberg <rydberg@euromail.se>
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef _EVEMU_IMPL_H
#define _EVEMU_IMPL_H

#include <evemu.h>
#include <linux/uinput.h>

#define EVPLAY_NBITS	KEY_CNT
#define EVPLAY_NBYTES	((EVPLAY_NBITS + 7) / 8)

struct evemu_device {
	unsigned int version;
	char name[UINPUT_MAX_NAME_SIZE];
	struct input_id id;
	unsigned char prop[EVPLAY_NBYTES];
	unsigned char mask[EV_CNT][EVPLAY_NBYTES];
	int pbytes, mbytes[EV_CNT];
	struct input_absinfo abs[ABS_CNT];
};

#endif
