FROM alpine:3.4

RUN \
    apk update && \
    apk add git perl && \
    git clone https://github.com/schacon/cowsay.git && \
    (cd cowsay && ./install.sh < /dev/null) && \
    rm -fr cowsay && \
    apk del git && \
    rm -fr /var/cache/apk

ARG MADE=unknown

LABEL \
    dockerbrew.name="cowsay" \
    dockerbrew.repo="hub.docker.com/brew/cowsay" \
    dockerbrew.cmds.cowsay="/usr/local/bin/cowsay [interactive]" \
    dockerbrew.cmds.cowthink="/usr/local/bin/cowthink [interactive]" \
    dockerbrew.made="$MADE"
