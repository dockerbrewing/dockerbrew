FROM alpine:3.4

RUN \
    apk update && \
    apk add git perl && \
    git clone https://github.com/schacon/cowsay.git && \
    (cd cowsay && ./install.sh < /dev/null) && \
    rm -fr cowsay && \
    apk del git && \
    rm -fr /var/cache/apk

ENTRYPOINT ["/usr/local/bin/cowsay"]

LABEL \
    com.dockerbrew.pkg.name="cowsay" \
    com.dockerbrew.run.options="-i" \
    com.dockerbrew.api.version="0.0.1"

# LABEL \
#     com.dockerbrew.repo="hub.docker.com/brew/cowsay" \
#     com.dockerbrew.cmds.cowsay="/usr/local/bin/cowsay [interactive]" \
#     com.dockerbrew.cmds.cowthink="/usr/local/bin/cowthink [interactive]" \
#     com.dockerbrew.made="$MADE"
