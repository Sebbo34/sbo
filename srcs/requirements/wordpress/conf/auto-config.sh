#!/bin/sh
cd /var/www/html/wordpress
wp core dowload --allow-root
curl -O https://raw.githubusercontent.com/WordPress/WordPress/master/wp-config-sample.php && \
    cp wp-config-sample.php wp-config.php
   	sed -i "s/database_name_here/inception/" wp-config.php && \
    sed -i "s/username_here/dbuser/" wp-config.php && \
    sed -i "s/password_here/dbpassword/" wp-config.php && \
    sed -i "s/localhost/mariadb:3306/" wp-config.php

wp core install --allow-root --url=https://localhost --title=Site_Title --admin_user=admin_username --admin_password=admin_password --admin_email=your@email.com
wp user create login email --role=user --user_pass=password --allow-root
mkdir /run/php
exec /usr/sbin/php-fpm7.4 -F -R