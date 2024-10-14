FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install mariadb-server -y   
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 
COPY ./tools/script.sh /docker-entrypoint/
RUN chmod +x /docker-entrypoint/script.sh
ENTRYPOINT ["/docker-entrypoint/script.sh"]
EXPOSE 3306
CMD ["mysqld", "--bind-address=0.0.0.0"]