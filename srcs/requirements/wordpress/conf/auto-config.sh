#!/bin/sh
cd /var/www/html/wordpress
wp core dowload --allow-root
curl -O https://raw.githubusercontent.com/WordPress/WordPress/master/wp-config-sample.php && \
    cp wp-config-sample.php wp-config.php
   	sed -i "s/database_name_here/my_database/" wp-config.php && \
    sed -i "s/username_here/my_user/" wp-config.php && \
    sed -i "s/password_here/my_password/" wp-config.php && \
    sed -i "s/localhost/mariadb:3306/" wp-config.php
sleep 15
wp core install --allow-root --url=https://sbo.42.fr --title=Site_Title --admin_user=admin_username --admin_password=admin_password --admin_email=your@email.com
wp user create login email --role=user --user_pass=password --allow-root
mkdir /run/php
exec /usr/sbin/php-fpm7.4 -F -R