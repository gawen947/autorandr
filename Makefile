BASH_COMP ?= /etc/bash_completion.d
PREFIX    ?= /usr/local
BIN       ?= /bin

install:
	install -m 555 autorandr $(DESTDIR)/$(PREFIX)/$(BIN)
	install -m 444 bash_completion/autorandr $(BASH_COMP)

uninstall:
	rm -f $(DESTDIR)/$(PREFIX)/$(BIN)/autorandr
	rm -f $(BASH_COMP)/autorandr
