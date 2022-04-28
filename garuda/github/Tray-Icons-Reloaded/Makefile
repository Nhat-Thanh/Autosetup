UUID = trayIconsReloaded@selfmade.pl
FILES = metadata.json extension.js TrayIndicator.js AppManager.js prefs.js stylesheet.css
EXTENSION_DIR=~/.local/share/gnome-shell/extensions

build: compile_schema
	-rm -fR ./_build
	mkdir -p _build
	cp $(FILES) _build
	mkdir -p _build/schemas
	cp schemas/*.xml _build/schemas/
	cp schemas/gschemas.compiled _build/schemas/
	mkdir -p _build/preferences
	cp preferences/* _build/preferences/

install:
	mkdir -p $(EXTENSION_DIR)
	rm -rf $(EXTENSION_DIR)/$(UUID)
	mkdir -p $(EXTENSION_DIR)/$(UUID)
	cp -rf _build/. $(EXTENSION_DIR)/$(UUID)/

compile_schema:
	glib-compile-schemas schemas/


clean:
	rm -rf _build


zip: _build
	cd _build ; \
	zip -qr "$(UUID).zip" .
	mv _build/$(UUID).zip ./
	-rm -fR _build
