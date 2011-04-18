lib_LTLIBRARIES = libutouch-evemu.la

libutouch_evemu_la_LDFLAGS = -version-info @LIB_VERSION@

libutouch_evemu_la_SOURCES = \
	evemu-impl.h \
	evemu.c

AM_CFLAGS = $(CWARNFLAGS)

INCLUDES = -I$(top_srcdir)/include/

libutouch_evemuincludedir = $(includedir)
libutouch_evemuinclude_HEADERS = \
	$(top_srcdir)/include/evemu.h
