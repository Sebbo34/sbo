#!/bin/sh

cd /var/www/wordpress

if [ ! -f wp-config.php ]; then
	pwd
	ls
    wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress/'
	ls
fi

exec "$@"
