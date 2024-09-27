FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install mariadb-server -y    
COPY /tools/script.sh /docker-entrypoint-initdb.d/

# Donner les droits d'exécution au script d'initialisation
RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh

# Exposer le port 3306 pour MariaDB
EXPOSE 3306

# Utiliser l'entrypoint par défaut pour MariaDB
CMD ["mysqld"]