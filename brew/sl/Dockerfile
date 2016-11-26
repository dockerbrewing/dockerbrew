FROM alpine:3.4

RUN apk update \
 && apk add build-base git ncurses-dev \
 && git clone https://github.com/mtoyoda/sl \
 && (cd /sl && make) \
 && apk del build-base git \
 && rm -fr /var/cache/apk \
 && true

LABEL \
    com.dockerbrew.name="sl" \
    com.dockerbrew.cmds.sl.path="/sl/sl" \
    com.dockerbrew.cmds.sl.opts="-it -e LINES:\$LINES -e COLUMNS:\$COLUMNS" \
    com.dockerbrew.brew="0.0.1"
