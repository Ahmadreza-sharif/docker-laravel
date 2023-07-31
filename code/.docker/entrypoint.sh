#!/bin/sh

composer i

php artisan install -l
php artisan optimize:clear
php artisan optimize

php-fpm
