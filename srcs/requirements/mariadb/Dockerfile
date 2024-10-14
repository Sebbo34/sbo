FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install mariadb-server -y   
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 
COPY ./tools/script.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/script.sh
ENTRYPOINT ["/docker-entrypoint-initdb.d/script.sh"]
EXPOSE 3306
CMD ["mysqld", "--bind-address=0.0.0.0"]