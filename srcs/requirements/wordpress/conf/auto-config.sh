#!/bin/sh

cd /var/www/html/wordpress
rm wp-config.php
if [ ! -f wp-config.php ]; then
    wp config create	--allow-root \
						--dbname="$SQL_DATABASE" \
						--dbuser="$SQL_USER" \
						--dbpass="$SQL_PASSWORD" \
						--dbhost=mariadb:3306 --path='/var/www/wordpress/'
    wp core install --allow-root --url=https://localhost --title=Site_Title --admin_user=admin_username --admin_password=admin_password --admin_email=your@email.com
    wp user create login email --role=user --user_pass=password --allow-root
fi
mkdir /run/php
exec /usr/sbin/php-fpm7.4 -F -R