/*****************************************************************************
 *
 * evemu - Kernel device emulation
 *
 * Copyright (C) 2010, 2011 Canonical Ltd.
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
 *
 * Copyright (C) 2010 Henrik Rydberg <rydberg@euromail.se>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 ****************************************************************************/

#include "evemu-impl.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <poll.h>
#include <ctype.h>
#include <unistd.h>

#ifndef UI_SET_PROPBIT
#define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
#define EVIOCGPROP(len)		_IOC(_IOC_READ, 'E', 0x09, len)
#define INPUT_PROP_POINTER		0x00
#define INPUT_PROP_DIRECT		0x01
#define INPUT_PROP_BUTTONPAD		0x02
#define INPUT_PROP_SEMI_MT		0x03
#define INPUT_PROP_MAX			0x1f
#define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
#endif

#define SYSCALL(call) while (((call) == -1) && (errno == EINTR))

static void copy_bits(unsigned char *mask, const unsigned long *bits, int bytes)
{
	int i;
	for (i = 0; i < bytes; i++) {
		int pos = 8 * (i % sizeof(long));
		mask[i] = (bits[i / sizeof(long)] >> pos) & 0xff;
	}
}

struct evemu_device *evemu_new(const char *name)
{
	struct evemu_device *dev = calloc(1, sizeof(struct evemu_device));

	if (dev) {
		dev->version = EVEMU_VERSION;
		evemu_set_name(dev, name);
	}

	return dev;
}

void evemu_delete(struct evemu_device *dev)
{
	free(dev);
}

unsigned int evemu_get_version(const struct evemu_device *dev)
{
	return dev->version;
}

const char *evemu_get_name(const struct evemu_device *dev)
{
	return dev->name;
}

void evemu_set_name(struct evemu_device *dev, const char *name)
{
	if (name && strlen(name) < sizeof(dev->name))
		strcpy(dev->name, name);
}

unsigned int evemu_get_id_bustype(const struct evemu_device *dev)
{
	return dev->id.bustype;
}

unsigned int evemu_get_id_vendor(const struct evemu_device *dev)
{
	return dev->id.vendor;
}

unsigned int evemu_get_id_product(const struct evemu_device *dev)
{
	return dev->id.product;
}

unsigned int evemu_get_id_version(const struct evemu_device *dev)
{
	return dev->id.version;
}

int evemu_get_abs_minimum(const struct evemu_device *dev, int code)
{
	return dev->abs[code].minimum;
}

int evemu_get_abs_maximum(const struct evemu_device *dev, int code)
{
	return dev->abs[code].maximum;
}

int evemu_get_abs_fuzz(const struct evemu_device *dev, int code)
{
	return dev->abs[code].fuzz;
}

int evemu_get_abs_flat(const struct evemu_device *dev, int code)
{
	return dev->abs[code].flat;
}

int evemu_get_abs_resolution(const struct evemu_device *dev, int code)
{
	return dev->abs[code].resolution;
}

int evemu_has_prop(const struct evemu_device *dev, int code)
{
	return (dev->prop[code >> 3] >> (code & 7)) & 1;
}

int evemu_has_event(const struct evemu_device *dev, int type, int code)
{
	return (dev->mask[type][code >> 3] >> (code & 7)) & 1;
}

int evemu_extract(struct evemu_device *dev, int fd)
{
	unsigned long bits[64];
	int rc, i;

	memset(dev, 0, sizeof(*dev));

	SYSCALL(rc = ioctl(fd, EVIOCGNAME(sizeof(dev->name)), dev->name));
	if (rc < 0)
		return rc;
	for (i = 0; i < sizeof(dev->name); i++)
		if (isspace(dev->name[i]))
			dev->name[i] = '-';

	SYSCALL(rc = ioctl(fd, EVIOCGID, &dev->id));
	if (rc < 0)
		return rc;

	SYSCALL(rc = ioctl(fd, EVIOCGPROP(sizeof(bits)), bits));
	if (rc >= 0) {
		copy_bits(dev->prop, bits, rc);
		dev->pbytes = rc;
	}

	for (i = 0; i < EV_CNT; i++) {
		SYSCALL(rc = ioctl(fd, EVIOCGBIT(i, sizeof(bits)), bits));
		if (rc < 0)
			continue;
		copy_bits(dev->mask[i], bits, rc);
		dev->mbytes[i] = rc;
	}

	for (i = 0; i < ABS_CNT; i++) {
		if (!evemu_has_event(dev, EV_ABS, i))
			continue;
		SYSCALL(rc = ioctl(fd, EVIOCGABS(i), &dev->abs[i]));
		if (rc < 0)
			return rc;
	}

	return 0;
}

static void write_prop(FILE * fp, const unsigned char *mask, int bytes)
{
	int i;
	for (i = 0; i < bytes; i += 8)
		fprintf(fp, "P: %02x %02x %02x %02x %02x %02x %02x %02x\n",
			mask[i], mask[i + 1], mask[i + 2], mask[i + 3],
			mask[i + 4], mask[i + 5], mask[i + 6], mask[i + 7]);
}

static void write_mask(FILE * fp, int index,
		       const unsigned char *mask, int bytes)
{
	int i;
	for (i = 0; i < bytes; i += 8)
		fprintf(fp, "B: %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
			index, mask[i], mask[i + 1], mask[i + 2], mask[i + 3],
			mask[i + 4], mask[i + 5], mask[i + 6], mask[i + 7]);
}

static void write_abs(FILE *fp, int index, const struct input_absinfo *abs)
{
	fprintf(fp, "A: %02x %d %d %d %d\n", index,
		abs->minimum, abs->maximum, abs->fuzz, abs->flat);
}

int evemu_write(const struct evemu_device *dev, FILE *fp)
{
	int i;

	fprintf(fp, "N: %s\n", dev->name);

	fprintf(fp, "I: %04x %04x %04x %04x\n",
		dev->id.bustype, dev->id.vendor,
		dev->id.product, dev->id.version);

	write_prop(fp, dev->prop, dev->pbytes);

	for (i = 0; i < EV_CNT; i++)
		write_mask(fp, i, dev->mask[i], dev->mbytes[i]);

	for (i = 0; i < ABS_CNT; i++)
		if (evemu_has_event(dev, EV_ABS, i))
			write_abs(fp, i, &dev->abs[i]);

	return 0;
}

static void read_prop(struct evemu_device *dev, FILE *fp)
{
	unsigned int mask[8];
	int i;
	while (fscanf(fp, "P: %02x %02x %02x %02x %02x %02x %02x %02x\n",
		      mask + 0, mask + 1, mask + 2, mask + 3,
		      mask + 4, mask + 5, mask + 6, mask + 7) > 0) {
		for (i = 0; i < 8; i++)
			dev->prop[dev->pbytes++] = mask[i];
	}
}

static void read_mask(struct evemu_device *dev, FILE *fp)
{
	unsigned int mask[8];
	int index, i;
	while (fscanf(fp, "B: %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
		      &index, mask + 0, mask + 1, mask + 2, mask + 3,
		      mask + 4, mask + 5, mask + 6, mask + 7) > 0) {
		for (i = 0; i < 8; i++)
			dev->mask[index][dev->mbytes[index]++] = mask[i];
	}
}

static void read_abs(struct evemu_device *dev, FILE *fp)
{
	struct input_absinfo abs;
	int index;
	while (fscanf(fp, "A: %02x %d %d %d %d\n", &index,
		      &abs.minimum, &abs.maximum, &abs.fuzz, &abs.flat) > 0)
		dev->abs[index] = abs;
}

int evemu_read(struct evemu_device *dev, FILE *fp)
{
	unsigned bustype, vendor, product, version;
	int ret;

	memset(dev, 0, sizeof(*dev));

	ret = fscanf(fp, "N: %s\n", dev->name);
	if (ret <= 0)
		return ret;

	ret = fscanf(fp, "I: %04x %04x %04x %04x\n",
		     &bustype, &vendor, &product, &version);
	if (ret <= 0)
		return ret;

	dev->id.bustype = bustype;
	dev->id.vendor = vendor;
	dev->id.product = product;
	dev->id.version = version;

	read_prop(dev, fp);

	read_mask(dev, fp);

	read_abs(dev, fp);

	return 1;
}

int evemu_write_event(FILE *fp, const struct input_event *ev)
{
	return fprintf(fp, "E: %lu.%06u %04x %04x %d\n",
		       ev->time.tv_sec, (unsigned)ev->time.tv_usec,
		       ev->type, ev->code, ev->value);
}

int evemu_record(FILE *fp, int fd, int ms)
{
        struct pollfd fds = { fd, POLLIN, 0 };
	struct input_event ev;
	int ret;

	while (poll(&fds, 1, ms) > 0) {
		SYSCALL(ret = read(fd, &ev, sizeof(ev)));
		if (ret < 0)
			return ret;
		if (ret == sizeof(ev))
			evemu_write_event(fp, &ev);
	}

	return 0;
}

int evemu_read_event(FILE *fp, struct input_event *ev)
{
	unsigned long sec;
	unsigned usec, type, code;
	int value;
	int ret = fscanf(fp, "E: %lu.%06u %04x %04x %d\n",
			 &sec, &usec, &type, &code, &value);
	ev->time.tv_sec = sec;
	ev->time.tv_usec = usec;
	ev->type = type;
	ev->code = code;
	ev->value = value;
	return ret;
}

int evemu_read_event_realtime(FILE *fp, struct input_event *ev,
			      struct timeval *evtime)
{
	unsigned long usec;
	int ret;

	ret = evemu_read_event(fp, ev);
	if (ret <= 0)
		return ret;

	if (evtime) {
		if (!evtime->tv_sec)
			*evtime = ev->time;
		usec = 1000000L * (ev->time.tv_sec - evtime->tv_sec);
		usec += ev->time.tv_usec - evtime->tv_usec;
		if (usec > 500) {
			usleep(usec);
			*evtime = ev->time;
		}
	}

	return ret;
}

int evemu_play(FILE *fp, int fd)
{
	struct input_event ev;
	struct timeval evtime;
	int ret;

	memset(&evtime, 0, sizeof(evtime));
	while (evemu_read_event_realtime(fp, &ev, &evtime) > 0)
		SYSCALL(ret = write(fd, &ev, sizeof(ev)));

	return 0;
}

static int set_prop_bit(int fd, int code)
{
	int ret;
	SYSCALL(ret = ioctl(fd, UI_SET_PROPBIT, code));
	return ret;
}

static int set_event_bit(int fd, int type, int code)
{
	int ret = 0;

	switch(type) {
	case EV_SYN:
		SYSCALL(ret = ioctl(fd, UI_SET_EVBIT, code));
		break;
	case EV_KEY:
		SYSCALL(ret = ioctl(fd, UI_SET_KEYBIT, code));
		break;
	case EV_REL:
		SYSCALL(ret = ioctl(fd, UI_SET_RELBIT, code));
		break;
	case EV_ABS:
		SYSCALL(ret = ioctl(fd, UI_SET_ABSBIT, code));
		break;
	case EV_MSC:
		SYSCALL(ret = ioctl(fd, UI_SET_MSCBIT, code));
		break;
	case EV_LED:
		SYSCALL(ret = ioctl(fd, UI_SET_LEDBIT, code));
		break;
	case EV_SND:
		SYSCALL(ret = ioctl(fd, UI_SET_SNDBIT, code));
		break;
	case EV_FF:
		SYSCALL(ret = ioctl(fd, UI_SET_FFBIT, code));
		break;
	case EV_SW:
		SYSCALL(ret = ioctl(fd, UI_SET_SWBIT, code));
		break;
	}

	return ret;
}

static int set_prop(const struct evemu_device *dev, int fd)
{
	int bits = 8 * dev->pbytes;
	int ret, i;
	for (i = 0; i < bits; i++) {
		if (!evemu_has_prop(dev, i))
			continue;
		ret = set_prop_bit(fd, i);
		if (ret < 0)
			return ret;
	}
	return 0;
}

static int set_mask(const struct evemu_device *dev, int type, int fd)
{
	int bits = 8 * dev->mbytes[type];
	int ret, i;
	for (i = 0; i < bits; i++) {
		if (!evemu_has_event(dev, type, i))
			continue;
		ret = set_event_bit(fd, type, i);
		if (ret < 0)
			return ret;
	}
	return 0;
}

int evemu_create(const struct evemu_device *dev, int fd)
{
	struct uinput_user_dev udev;
	int ret, i;

	memset(&udev, 0, sizeof(udev));
	memcpy(udev.name, dev->name, sizeof(udev.name));
	udev.id = dev->id;
	for (i = 0; i < ABS_CNT; i++) {
		if (!evemu_has_event(dev, EV_ABS, i))
			continue;
		udev.absmax[i] = dev->abs[i].maximum;
		udev.absmin[i] = dev->abs[i].minimum;
		udev.absfuzz[i] = dev->abs[i].fuzz;
		udev.absflat[i] = dev->abs[i].flat;
	}

	ret = set_prop(dev, fd);
	if (ret < 0)
		return ret;

	for (i = 0; i < EV_CNT; i++) {
		ret = set_mask(dev, i, fd);
		if (ret < 0)
			return ret;
	}

	SYSCALL(ret = write(fd, &udev, sizeof(udev)));
	if (ret < 0)
		return ret;

	SYSCALL(ret = ioctl(fd, UI_DEV_CREATE, NULL));
	return ret;
}

void evemu_destroy(int fd)
{
	int ret;
	SYSCALL(ret = ioctl(fd, UI_DEV_DESTROY, NULL));
}
