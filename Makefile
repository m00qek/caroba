all: clean watch

clean:
	@rm release -rf
	@rm connection-assistant/elm-stuff/ -rf

prepare:
	@go get github.com/yosssi/goat

build-webserver:
	@mkdir -p release
	@go build -o release/caroba-webserver webserver/src/main.go

build-assets:
	@cp connection-assistant/assets release -rf
	@cp connection-assistant/index.html release -f

build-js:
	@cd connection-assistant && elm make src/Main.elm \
		--output ../release/assets/connection-assistant.js

serve:
	@cd release && ./caroba-webserver

build: build-webserver build-js build-assets

watch: build
	@goat

