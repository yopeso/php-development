#!/usr/bin/env bash

chown -R www-data:www-data /var/www
service php7.0-fpm restart
service nginx restart
tail -f /dev/null