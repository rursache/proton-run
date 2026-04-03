PREFIX ?= /usr
DESTDIR ?=

install:
	install -Dm755 proton-run $(DESTDIR)$(PREFIX)/bin/proton-run
	install -Dm644 proton-run.desktop $(DESTDIR)$(PREFIX)/share/applications/proton-run.desktop

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/proton-run
	rm -f $(DESTDIR)$(PREFIX)/share/applications/proton-run.desktop
