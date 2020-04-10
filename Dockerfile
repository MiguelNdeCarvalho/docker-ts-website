FROM alpine:3.11
LABEL maintainer="MiguelNdeCarvalho <geral@miguelndecarvalho.pt>"

ENV UID=0 \
    GID=0

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
      nginx \
      supervisor \
      curl

ADD rootfs /

RUN /bin/sh /rootfs/setup.sh


CMD ["/bin/s6-svscan", "/etc/s6.d"]
