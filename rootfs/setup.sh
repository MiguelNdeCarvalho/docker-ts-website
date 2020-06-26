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
chown -R abc:abc /var/www/html && \
chown -R abc:abc /run && \
chown -R abc:abc /var/lib/nginx && \
chown -R abc:abc /var/log/nginx
chmod +x /start.sh
