ARG pg_version=13

FROM postgres:${pg_version}-alpine

RUN set -ex \
    && apk add --no-cache --virtual .build-deps gcc libc-dev make pkgconf clang llvm cmake g++ \
    && wget -q -O - http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2 | tar jxf - \
    && wget -q -O - "https://github.com/amutu/zhparser/archive/master.tar.gz" | tar zxf - \
    && wget -q -O - "https://github.com/eradman/pg-safeupdate/archive/master.tar.gz" | tar zxf - \
    && wget -q -O - https://github.com/citusdata/pg_cron/archive/main.tar.gz | tar zxf - \
    && cd /scws-1.2.3 \
    && ./configure \
    && make install \
    && cd /zhparser-master \
    && make \
    && make install \
    && cd /pg-safeupdate-master \
    && make \
    && make install \
    && cd /pg_cron-main \
    && sed -i "s/Werror/Wno-error=format-security/g" Makefile \
    && make \
    && make install \
    && apk add --no-cache  postgresql-contrib \
    && rm -rf /zhparser-master /scws-1.2.3  /pg-safeupdate-master /pg_cron-main \
    && apk del .build-deps

COPY install_extension.sql init_extension.sh /docker-entrypoint-initdb.d/
