noinst_PROGRAMS = \
	evemu-echo

bin_PROGRAMS = \
	evemu-describe \
	evemu-device \
	evemu-record \
	evemu-play

INCLUDES=-I$(top_srcdir)/include/

AM_LDFLAGS = $(top_builddir)/src/libutouch-evemu.la


# man page generation
if HAVE_DOCTOOLS
# actual man pages
man_pages_sources = evemu-describe.txt evemu-device.txt
# shadow man pages
man_pages_shadows = evemu-record.1 evemu-play.1

man_pages = $(man_pages_sources:.txt=.1) $(man_pages_shadows)

SUFFIXES = .1 .txt .xml

.xml.1:
	@$(XMLTO) man $<

.txt.xml:
	@$(ASCIIDOC) -b docbook -d manpage -o $@ $<

dist_man_MANS = $(man_pages)
CLEANFILES = $(dist_man_MANS)
MAINTAINERCLEANFILES = $(man_pages) *.xml
endif
