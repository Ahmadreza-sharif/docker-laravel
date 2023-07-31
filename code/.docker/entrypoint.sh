#!/bin/sh

composer i

php artisan optimize:clear

php-fpm
