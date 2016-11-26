FROM alpine:3.4

RUN apk update \
 && apk add bash build-base curl git openssl openssl-dev perl perl-dev wget \
 && curl -L https://cpanmin.us | perl - App::cpanminus \
 && cpanm -n Zilla::Dist \
 && apk del build-base openssl-dev perl-dev \
 && rm -fr /var/cache/apk \
 && rm -fr /root/.cpanm \
 && true

LABEL \
    com.dockerbrew.name="zild" \
    com.dockerbrew.cmds.zild.path="/usr/local/bin/zild" \
    com.dockerbrew.cmds.zild.opts="-v \$PWD:/work" \
    com.dockerbrew.brew="0.0.1"

WORKDIR /work

ENV PERL5LIB /local
