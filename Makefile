PREFIX ?= /usr
DESTDIR ?=

install:
	install -Dm755 proton-run $(DESTDIR)$(PREFIX)/bin/proton-run
	install -Dm644 assets/proton-run.desktop $(DESTDIR)$(PREFIX)/share/applications/proton-run.desktop
	install -Dm644 assets/default-config.yaml $(DESTDIR)$(PREFIX)/share/proton-run/default-config.yaml
	install -Dm644 assets/icon_white.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/proton-run-light.svg
	install -Dm644 assets/icon_black.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/proton-run-dark.svg
	install -Dm644 assets/icon_white.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/proton-run.svg

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/proton-run
	rm -f $(DESTDIR)$(PREFIX)/share/applications/proton-run.desktop
	rm -rf $(DESTDIR)$(PREFIX)/share/proton-run
	rm -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/proton-run-light.svg
	rm -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/proton-run-dark.svg
	rm -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/proton-run.svg
