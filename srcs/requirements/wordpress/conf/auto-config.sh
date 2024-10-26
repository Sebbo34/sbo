#!/bin/sh

cd /var/www/html/wordpress
mkdir /run/php
exec /usr/sbin/php-fpm7.4 -F -R