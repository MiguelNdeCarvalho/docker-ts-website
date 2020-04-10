FROM alpine:3.11
LABEL maintainer="MiguelNdeCarvalho <geral@miguelndecarvalho.pt>"

ENV PUID=0 \
    PGID=0

RUN apk upgrade --no-cache \
 && apk add --no-cache \
      nginx \
      php7 \
      php7-fpm \
      php7-mysqli \
      php7-json \
      php7-openssl \
      php7-curl \
      php7-zlib \
      php7-xml \
      php7-phar \
      php7-intl \
      php7-dom \
      php7-xmlreader \
      php7-ctype \
      php7-session \
      php7-mbstring \ 
      php7-gd \
      php7-tokenizer \
      php7-pdo_mysql \
      nginx \
      supervisor \
      curl

COPY rootfs .

RUN ./setup.sh

VOLUME /var/www/html

EXPOSE 80

USER nobody

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping