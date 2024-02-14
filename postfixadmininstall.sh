#!/bin/bash

# Opdater apt-pakkelisten
sudo apt update

# Installer Apache, PHP, MySQL og andre nødvendige pakker
sudo apt install -y apache2 php php-mysql mysql-server

# Download og udpak PostfixAdmin
wget -O /tmp/postfixadmin.tar.gz https://github.com/postfixadmin/postfixadmin/archive/postfixadmin-3.3.10.tar.gz
sudo tar -xzvf /tmp/postfixadmin.tar.gz -C /var/www/html/

# Flyt PostfixAdmin-filer til webrodmappe
sudo mv /var/www/html/postfixadmin-postfixadmin-3.3.10 /var/www/html/postfixadmin

# Kopier konfigurationsfilen og indstil ejerskab
sudo cp /var/www/html/postfixadmin/config.inc.php /var/www/html/postfixadmin/config.local.php
sudo chown www-data:www-data /var/www/html/postfixadmin/config.local.php

# Opret en tom database til PostfixAdmin
DB_USER="postfixadmin"
DB_PASSWORD="DIT_PASSWORD"
DB_NAME="postfixadmin"
sudo mysql -e "CREATE DATABASE $DB_NAME;"
sudo mysql -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
sudo mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Opdater konfigurationsfilen med databaseoplysninger
sudo sed -i "s/\$CONF\['database_type'\] = 'mysqli';/\$CONF['database_type'] = 'mysqli';\n\$CONF['database_host'] = 'localhost';\n\$CONF['database_user'] = '$DB_USER';\n\$CONF['database_password'] = '$DB_PASSWORD';\n\$CONF['database_name'] = '$DB_NAME';/" /var/www/html/postfixadmin/config.local.php

# Genstart Apache for at anvende ændringer
sudo systemctl restart apache2

# Giv besked om, at installationen er fuldført
echo "PostfixAdmin er installeret og konfigureret. Du kan nu åbne webgrænsefladen i din browser."
