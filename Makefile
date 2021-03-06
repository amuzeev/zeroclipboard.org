VERSION = 1.3.3
PORT = 3000

all: \
	node_modules \
	update \
	server \

node_modules:
	npm install

update:
	curl -o javascripts/zc/ZeroClipboard_$(VERSION).js https://raw.github.com/zeroclipboard/zeroclipboard/v$(VERSION)/ZeroClipboard.js
	curl -o javascripts/zc/ZeroClipboard_$(VERSION).swf https://raw.github.com/zeroclipboard/zeroclipboard/v$(VERSION)/ZeroClipboard.swf
	@echo "Downloaded v$(VERSION) of the ZeroClipboard JS and SWF files."
	@echo "IMPORTANT: You must update the \"index.html\" file to enable selecting new versions!"

commit: update
	git add .
	git commit -a -m "Update demo files to latest changes."
	git push

server: update
	open "http://localhost:$(PORT)/" && node node_server.js

.PHONY: all update commit server