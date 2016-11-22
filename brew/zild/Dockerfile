FROM perl:5.24

RUN cpanm -n Zilla::Dist

COPY $PWD/zilla-dist-pm /zilla-dist-pm

RUN find /zilla-dist-pm

RUN cd /zilla-dist-pm \
 && zild install

WORKDIR /work

ENV PERL5LIB /local

ENTRYPOINT [ "/usr/local/bin/zild" ]

LABEL \
    com.dockerbrew.pkg.name="zild" \
    com.dockerbrew.run.options="-v \$PWD:/work" \
    com.dockerbrew.api.version="0.0.1"
