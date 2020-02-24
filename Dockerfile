FROM docker:19.03.6-git

LABEL maintainer="Frank Giesecke <frank.giesecke@skriptfabrik.com>"

ENV DOCKER_BUILDKIT=1

SHELL [ "/bin/sh", "-xe", "-c" ]
RUN apk add --no-cache --upgrade \
        "curl=7.67.0-r0" \
        "openssh=8.1_p1-r0" \
        "python2=2.7.16-r3"

SHELL [ "/bin/sh", "-xe", "-c" ]
RUN apk add --no-cache --virtual .build-deps \
        "gcc=9.2.0-r3" \
        "libc-dev=0.7.2-r0" \
        "libffi-dev=3.2.1-r6" \
        "openssl-dev=1.1.1d-r3" \
        "make=4.2.1-r2" \
        "musl-dev=1.1.24-r0" \
        "py2-pip=18.1-r0" \
        "python2-dev=2.7.16-r3"

SHELL [ "/bin/sh", "-xe", "-c" ]
RUN pip install --no-cache-dir \
        "docker-compose==1.24.1"

SHELL [ "/bin/sh", "-xe", "-c" ]
RUN apk del .build-deps
