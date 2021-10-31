#!/bin/bash
chmod -R 775 /var/www/cleanetto/vendor
chmod -R 775 /var/www/cleanetto/storage
chown -R www-data:www-data /var/www/cleanetto

php artisan migrate --force
php artisan optimize:clear

nginx

php-fpm
