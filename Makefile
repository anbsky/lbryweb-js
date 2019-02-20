js:
	scripts/build_js.sh

release:
	github-release release -u sayplastic -r lbryweb-js -t $(VERSION) --name "$(NAME)"
