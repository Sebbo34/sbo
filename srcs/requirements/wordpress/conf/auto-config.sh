#!/bin/sh

cd /var/www/html/wordpress
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

wp core install --allow-root --url=https://localhost --title=Site_Title --admin_user=admin_username --admin_password=admin_password --admin_email=your@email.com
wp user create login email --role=user --user_pass=password --allow-root
mkdir /run/php
exec /usr/sbin/php-fpm7.4 -F -R