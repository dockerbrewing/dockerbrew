FROM alpine:3.4

RUN apk update \
 && apk add git perl \
 && git clone https://github.com/schacon/cowsay.git \
 && (cd cowsay && ./install.sh < /dev/null) \
 && rm -fr cowsay \
 && apk del git \
 && rm -fr /var/cache/apk \
 && true

LABEL \
    com.dockerbrew.name="cowsay" \
    com.dockerbrew.cmds.cowsay.path="/usr/local/bin/cowsay" \
    com.dockerbrew.cmds.cowsay.opts="-i" \
    com.dockerbrew.brew="0.0.1"

#     com.dockerbrew.home="hub.docker.com/brew/cowsay" \
#     com.dockerbrew.made="$MADE"
