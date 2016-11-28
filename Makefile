ALL_BREW := $(shell echo brew/*)
ALL_BREW := $(ALL_BREW:brew/%=%)
ALL_DATA := $(ALL_BREW:%=brew/%/Brewfile)
ALL_BUILD := $(ALL_BREW:%=build-%)
ALL_PUSH := $(ALL_BREW:%=push-%)
ALL_SHELL := $(ALL_BREW:%=shell-%)
ALL_DOCKERFILE := $(ALL_BREW:%=dockerfile-%)
ALL_INDEX := \
    pkg-desc.tsv \
    cmd-pkg.tsv
ALL_INDEX := $(ALL_INDEX:%=index/%)

NAME ?= $(shell basename $$PWD)
# MADE := $(shell printf "0.0.1 "; date -u "+%Y%m%d-%H%M%S")

define HELP

Makefile targets:

    index        - Rebuild the index files
    all-build    - Build all brew docker images
    all-push     - Push all brew docker images

endef
export HELP

# xxx:
# 	echo $(ALL_DOCKERFILE)

help:
	@echo "$$HELP"

index: $(ALL_INDEX)

$(ALL_INDEX): Makefile $(ALL_DATA) node_modules bin/*
	./bin/$(@:index/%.tsv=%) $(ALL_DATA) > $@

all-build: node_modules $(ALL_BUILD)

all-push: node_modules $(ALL_PUSH)

all-dockerfile: node_modules $(ALL_DOCKERFILE)

$(ALL_BUILD):
	make -C brew/$(@:build-%=%) -f ../../Makefile docker-build

$(ALL_PUSH):
	make -C brew/$(@:push-%=%) -f ../../Makefile docker-push

$(ALL_SHELL):
	make -C brew/$(@:shell-%=%) -f ../../Makefile docker-shell

$(ALL_DOCKERFILE):
	make -C brew/$(@:dockerfile-%=%) -f ../../Makefile Dockerfile

node_modules:
	npm install .

docker-build: print-header Dockerfile
	docker build -t brew/$(NAME) .

docker-push: print-header docker-build
	docker push brew/$(NAME)

docker-shell: docker-build
	docker run -it --entrypoint=/bin/sh brew/$(NAME)

docker-labels: docker-build
	docker inspect -f '{{range $$k,$$v:=.Config.Labels }}{{$$k}}={{$$v}}{{"\n"}}{{end}}' $(NAME)

Dockerfile: Brewfile
	../../bin/dockerfile $< > $@

print-header:
	@echo \
================================================================================
	@echo = $(NAME)
	@echo \
================================================================================

clean:
	rm -fr node_modules brew/*/Dockerfile
