#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install apache2 -y
sudo apt install php libapache2-mod-php php-{fpm,pear,imap,apcu,intl,cgi,common,mbstring,net-socket,gd,xml-util,mysql,bcmath} -y
sudo service apache2 start
sudo systemctl enable apache2
sudo curl -s https://api.github.com/repos/osTicket/osTicket/releases/latest \
	| grep browser_download_url \
	| grep "browser_download_url" \
	| cut -d '"' -f 4 \
	| wget -i -
sudo apt-get install unzip
sudo unzip osTicket-v*.zip -d osTicket
sudo mv osTicket /var/www/html
cd /var/www/html/osTicket/upload/include
sudo cp ost-sampleconfig.php ost-config.php
sudo chown -R www-data:www-data /var/www/
sudo apt install mysql-client-core-8.0 #install mysql client for testing connection
sudo service apache2 restart
