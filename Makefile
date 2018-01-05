# SETUP
APP_NAME=gaborsomogyi/ebook-convert

# PARAMETERS
SOURCE?=epub
FILENAME?=*.$(SOURCE)
TARGET?=mobi

# HELP
# This will output the help for each task
# based on https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help


# DOCKER TASKS
build: ## build the container
	docker build -t $(APP_NAME) .

build-clean: ## build the container
	docker build --no-cache=true -t $(APP_NAME) .

push:
	docker push $(APP_NAME)

run: ## alias to convert-all
	make convert-all

convert: ## converts file specified in argument FILENAME to mobi
	docker run --rm -it -v "$(PWD):/home" $(APP_NAME) "$(FILENAME)" .$(TARGET)

convert-all: ## converts all epub files in the folder to mobi
	for f in *.$(SOURCE); do docker run --rm -it -v "$(PWD):/home" $(APP_NAME) "$$f" .$(TARGET); done

bash: ## runs bash in container, for debugging
	docker run --rm -it -v "$(PWD):/home" --entrypoint "/bin/bash" $(APP_NAME)
