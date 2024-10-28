#!/bin/sh
cd /var/www/html/wordpress
wp core download --allow-root
curl -O https://raw.githubusercontent.com/WordPress/WordPress/master/wp-config-sample.php && \
    cp wp-config-sample.php wp-config.php
   	sed -i "s/database_name_here/my_database/" wp-config.php && \
    sed -i "s/username_here/my_user/" wp-config.php && \
    sed -i "s/password_here/my_password/" wp-config.php && \
    sed -i "s/localhost/mariadb:3306/" wp-config.php
sleep 5
wp core install --allow-root --url=https://$DOMAINE_NAME --title=$SITE_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL

wp user create	--allow-root \
			${USER1_LOGIN} ${USER1_MAIL} \
			--role=author \
			--user_pass=${USER1_PASS} ;
mkdir /run/php
exec /usr/sbin/php-fpm7.4 -F -R