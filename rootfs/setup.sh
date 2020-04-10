#!/bin/sh

cd /tmp && \
wget -O ts-website.zip https://github.com/Wruczek/ts-website/releases/download/dev-2.0.5.1/ts-website-dev-2.0.5.1-d7f5b01.zip && \
unzip -d /var/www/ ts-website.zip