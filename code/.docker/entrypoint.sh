#!/bin/sh

composer i

php artisan optimize:clear

php artisan migrate:fresh --seed

nohup php artisan queue:work --daemon >> storage/logs/laravel.log &

php-fpm
