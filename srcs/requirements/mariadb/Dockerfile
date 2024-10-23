FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install mariadb-server -y   
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /
RUN chmod +x /script.sh
EXPOSE 3306
CMD ["/script.sh"]