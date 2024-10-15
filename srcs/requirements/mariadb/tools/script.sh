#!/bin/sh

export SQL_DATABASE=my_database SQL_USER=my_user SQL_PASSWORD=my_password SQL_ROOT_PASSWORD=my_root_password WP_PATH=/var/www/html/wordpress
# Démarrer MySQL avec mysqld_safe
mysqld_safe
# Attendre que MySQL démarre


until mysqladmin ping &>/dev/null; do
  echo "Waiting for MySQL to start..."
  sleep 2
done

# Créer la base de données si elle n'existe pas
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Créer l'utilisateur et lui accorder des privilèges si nécessaire
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Modifier le mot de passe root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Appliquer les privilèges
mysql -e "FLUSH PRIVILEGES;"

# Laisser MySQL tourner en avant-plan pour que le conteneur reste actif
exec mysqld_safe
exec "$@"
