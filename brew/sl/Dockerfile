FROM ubuntu

RUN apt-get update \
 && apt-get install -y sl

ENTRYPOINT ["/usr/games/sl"]

LABEL \
    com.dockerbrew.pkg.name="sl" \
    com.dockerbrew.run.options="-t" \
    com.dockerbrew.api.version="0.0.1"
