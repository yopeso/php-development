#!/usr/bin/env bash

service php7.0-fpm start
service elasticsearch start

exec /usr/bin/supervisord -n -c /etc/supervisord.conf
