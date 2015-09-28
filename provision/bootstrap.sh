#!/usr/bin/env bash

# Update sources
apt-get update

# Install apache and configure DocRoot dir
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/www /var/www
fi 

# Install PHP, MySQL and other necessary libs
apt-get install -y php5 php5-mysql php5-gd php5-xdebug php5-intl
