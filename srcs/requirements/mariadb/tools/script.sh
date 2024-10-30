#!/bin/bash

# Étape 1 : Créer le fichier SQL pour l'initialisation de la base de données et des utilisateurs
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

# Étape 2 : Démarrer MySQL temporairement en mode sécurisé pour l'initialisation
mysqld_safe --skip-networking --skip-grant-tables &
sleep 5  # Donne le temps au serveur MySQL de démarrer

# Étape 3 : Exécuter le fichier SQL pour créer la base et configurer les utilisateurs
mysql < db1.sql

# Étape 4 : Arrêter MySQL après l'initialisation
mysqladmin -u root shutdown

# Étape 5 : Lancer MySQL en avant-plan pour garder le conteneur actif
exec mysqld_safe