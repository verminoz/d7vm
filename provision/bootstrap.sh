#!/usr/bin/env bash

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

# Install composer globally and Drush 7.x
apt-get install -y curl
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer global require drush/drush:7.*
export PATH="$HOME/.composer/vendor/bin:$PATH"
