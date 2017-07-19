#!/usr/bin/env bash

echo -e "\n\nxpack.security.enabled: false" >> /usr/share/elasticsearch/config/elasticsearch.yml

exec /usr/bin/supervisord -n -c /etc/supervisord.conf
