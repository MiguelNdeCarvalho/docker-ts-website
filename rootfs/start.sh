#!/bin/sh

echo "Set permissions for fivem user"
usermod -u ${UID} abc
usermod -g ${GID} abc

if [ "$(ls -A /var/www/html)" ]; then
     echo "Website already there"
else
    cd /tmp 
    wget -O ts-website.zip https://github.com/Wruczek/ts-website/releases/download/dev-2.0.5.1/ts-website-dev-2.0.5.1-d7f5b01.zip
    unzip -d /var/www/html/ ts-website.zip
    rm /tmp/ts-website.zip
    mv /var/www/html/ts-website/* /var/www/html
    chown -R ${UID}:${GID} /var/www/html
fi