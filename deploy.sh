#!/bin/bash

set -e
echo "Deployment Started..."
cd /var/www/laravel-todo-tsm/
git pull
composer install
npm install
npm run build
php artisan migrate --force
php artisan optimize
echo "Deployment Finished"
