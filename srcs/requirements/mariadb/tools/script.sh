
# Démarrer MySQL avec mysqld_safe en arrière-plan
mysqld_safe &

# Attendre que MySQL soit prêt
until mysqladmin ping -u root -p"${SQL_ROOT_PASSWORD}" &>/dev/null; do
  echo "Waiting for MySQL to start..."
  sleep 2
done

# Créer la base de données si elle n'existe pas
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Créer l'utilisateur et lui accorder des privilèges si nécessaire
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';"

# Modifier le mot de passe root
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Appliquer les privilèges
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Laisser MySQL tourner en avant-plan pour que le conteneur reste actif
exec mysqld_safe
