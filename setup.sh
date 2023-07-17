#!/bin/sh

CONTAINER_ALREADY_STARTED="/var/www/not-first-init"

if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup, running initialization --"
    composer install --no-interaction --prefer-dist --optimize-autoloader
    php artisan storage:link || true
    php artisan key:generate

else
    echo "-- Not first run, no initialization needed --"

fi