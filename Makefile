BASH_COMP  ?= /etc/bash_completion.d
UDEV_RULES ?= /lib/udev/rules.d
PREFIX     ?= /usr/local
BIN        ?= /bin
SH_LIB     ?= /lib/sh

install:
	mkdir -p $(DESTDIR)/$(PREFIX)/$(SH_LIB)
	install -m 555 autorandr $(DESTDIR)/$(PREFIX)/$(BIN)
	install -m 555 autorandr.sh $(DESTDIR)/$(PREFIX)/$(SH_LIB)
	install -m 444 bash_completion/autorandr $(BASH_COMP)
	
	echo 'ACTION=="change", SUBSYSTEM=="drm", RUN+="$(DESTDIR)/$(PREFIX)/$(SH_LIB)/autorandr.sh"' \
		> $(UDEV_RULES)/64-autorandr.rules

uninstall:
	rm -f $(DESTDIR)/$(PREFIX)/$(BIN)/autorandr
	rm -f $(BASH_COMP)/autorandr
	rm -f $(UDEV_RULES)/64-autorandr.rules
