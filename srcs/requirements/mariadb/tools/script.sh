#!/bin/bash

mysqld_safe --skip-networking &
sleep 5
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

mysqld_safe