#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install mysql-server -y
cd /etc/mysql/mysql.conf.d
sudo sed -i 's/127.0.0.1/192.168.1.175/g' mysqld.cnf
sudo mysql -e "CREATE DATABASE osticket;"
sudo mysql -e "CREATE USER 'ticketmaster'@'192.168.1.176' IDENTIFIED BY 'osticket';"
sudo mysql -e "GRANT ALL PRIVILEGES ON osticket.*  TO 'ticketmaster'@'192.168.1.176';"
sudo mysql -e "FLUSH PRIVILEGES;"
cd ~
sudo service mysql restart

