SHELL := /bin/bash
IMAGE_NAME := jupyter-spark-notebook

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

build: ## Build local almond jupyter spark kernal image
	./docker.sh build -t ${IMAGE_NAME} .
.PHONY: build

run: build ## Run jupyter-spark-notebook
	./docker.sh run -it --rm -p 8888:8888 -v ${PWD}/notebooks:/home/jovyan/work ${IMAGE_NAME}
.PHONY: run