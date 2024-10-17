FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client
	
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./conf/auto-config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/auto-config.sh
EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/auto-config.sh"]
RUN mkdir -p /run/php
CMD ["/usr/sbin/php-fpm7.4", "-F"]