all: build

clean:
	@rm release -rf
	@rm connection-assistant/elm-stuff/ -rf

release: clean
	@mkdir -p release
	@go build -o release/caroba-webserver webserver/src/main.go
	@cp connection-assistant/assets release -rf
	@cp connection-assistant/index.html release -f
	@cd connection-assistant && elm make src/Main.elm \
		--output ../release/assets/connection-assistant.js
