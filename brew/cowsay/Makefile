NAME := brew/cowsay
MADE := $(shell printf "0.0.1 "; date -u "+%Y%m%d-%H%M%S")

build:
	docker build \
	    --build-arg MADE="$(MADE)" \
	    -t $(NAME) .

push: build
	docker push $(NAME)

shell: build
	docker run -it --entrypoint=sh $(NAME)

inspect: build
	docker inspect $(NAME)

labels: build
	docker inspect -f '{{range $$k,$$v:=.Config.Labels }}{{$$k}}={{$$v}}{{"\n"}}{{end}}' $(NAME)
