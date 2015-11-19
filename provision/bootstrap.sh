#!/usr/bin/env bash

echo 'Setting server up...'

# Update sources
apt-get update
apt-get install -y software-properties-common python-software-properties
add-apt-repository ppa:ondrej/php5
apt-get update

# Install apache and configure DocRoot dir
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/www /var/www
fi

# Install PHP 5.5
apt-get install -y php5

# Install PHP libs, MySQL and other necessary libs
apt-get install -y php5-mysql php5-gd php5-xdebug php5-intl php5-curl

# Install MySQL/MariaDB server and client without password prompt
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server mysql-client

# Enable mod_rewrite for clean URLs
a2enmod rewrite

# Configure Apache2 and a virtual host for it
cp -f /vagrant/provision/conf/apache2.conf /etc/apache2/apache2.conf
rm /etc/apache2/sites-available/*
rm /etc/apache2/sites-enabled/*
cp -f /vagrant/provision/conf/drupal.conf /etc/apache2/sites-available/drupal.conf
cp -f /vagrant/provision/conf/drupal.conf /etc/apache2/sites-enabled/drupal.conf

# Take care of PHP and XDebug config
cp -f /vagrant/provision/conf/php.ini /etc/php5/apache2/php.ini
cp -f /vagrant/provision/conf/20-xdebug.ini /etc/php5/apache2/conf.d/20-xdebug.ini

# Let's restart apache for all the changes to take place
service apache2 restart

# Install cURL, useful later
apt-get install -y curl

echo 'Finished setting server up!'
