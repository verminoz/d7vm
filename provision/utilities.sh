#!/usr/bin/env bash

# Install composer globally and Drush 7.x
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer global require drush/drush:7.*
sudo ln -s ~/.composer/vendor/bin/drush /usr/local/bin/drush
export PATH="$HOME/.composer/vendor/bin:$PATH"
