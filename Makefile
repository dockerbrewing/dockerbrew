ALL_BREW := $(shell echo brew/*)
ALL_META := $(ALL_BREW:%=%/Meta)
ALL_BUILD := $(ALL_BREW:%=build-%)
ALL_PUSH := $(ALL_BREW:%=push-%)
ALL_SHELL := $(ALL_BREW:%=shell-%)

NAME ?= $(shell basename $$PWD)
# MADE := $(shell printf "0.0.1 "; date -u "+%Y%m%d-%H%M%S")

define HELP

Makefile targets:

    Index        - Rebuild the Index file
    build-all    - Build all brew docker images
    push-all     - Push all brew docker images

endef
export HELP

help:
	@echo "$$HELP"

Index: Makefile $(ALL_META)
	./bin/generate-index $(ALL_META) > $@

build-all: $(ALL_BUILD)

push-all: $(ALL_PUSH)

$(ALL_BUILD):
	make -C $(@:build-%=%) -f ../../Makefile docker-build

$(ALL_PUSH):
	make -C $(@:push-%=%) -f ../../Makefile docker-push

$(ALL_SHELL):
	make -C $(@:shell-%=%) -f ../../Makefile docker-shell

docker-build: print-header
	docker build -t brew/$(NAME) .

docker-push: print-header docker-build
	docker push brew/$(NAME)

docker-shell: docker-build
	docker run -it --entrypoint=/bin/sh brew/$(NAME)

docker-labels: docker-build
	docker inspect -f '{{range $$k,$$v:=.Config.Labels }}{{$$k}}={{$$v}}{{"\n"}}{{end}}' $(NAME)

print-header:
	@echo \
================================================================================
	@echo = $(NAME)
	@echo \
================================================================================
