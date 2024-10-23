#!/bin/sh

cd /var/www/wordpress

if [ ! -f wp-config.php ]; then
	echo ici
    wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
    wp core install --allow-root --url=localhost --title=Site_Title --admin_user=admin_username --admin_password=admin_password --admin_email=your@email.com
    wp user create login email [--role=user] [--user_pass=password] [--allow-root]
fi

exec "$@"
