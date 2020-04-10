#!/bin/sh
# Configure NGINX
mv /config/nginx.conf /etc/nginx/nginx.conf
rm /etc/nginx/conf.d/default.conf

# Configure PHP-FPM
mv /config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
mv /config/php.ini /etc/php7/conf.d/custom.ini

# Configure supervisord
mv /config/supervisord.conf /etc/supervisord.conf
# Create the www folderrootfs
mkdir -p /var/www/html

# Change the Permissions
chown -R nobody.nobody /var/www/html && \
chown -R nobody.nobody /run && \
chown -R nobody.nobody /var/lib/nginx && \
chown -R nobody.nobody /var/log/nginx

# Install the TS Website
cd /tmp 
wget -O ts-website.zip https://github.com/Wruczek/ts-website/releases/download/dev-2.0.5.1/ts-website-dev-2.0.5.1-d7f5b01.zip
unzip -d /var/www/html/ ts-website.zip
mv /var/www/html/ts-website/* /var/www/html
chown -R nobody:nobody /var/www/html
