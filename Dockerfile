FROM docker.io/alpine:3.11.0
LABEL maintainer="MiguelNdeCarvalho <geral@miguelndecarvalho.pt>"

ENV UID=1337 \
    GID=1337

RUN apk upgrade --no-cache \
 && apk add --no-cache \
      s6 \
      su-exec \
      nginx \
      php7 \
      php7-mbstring \
      php7-curl
      
RUN cd /tmp && \
    wget -O ts-website.zip https://github.com/Wruczek/ts-website/releases/download/dev-2.0.5.1/ts-website-dev-2.0.5.1-d7f5b01.zip && \
    unzip -d /var/www/ ts-website.zip

ADD root /

CMD ["/bin/s6-svscan", "/etc/s6.d"]
