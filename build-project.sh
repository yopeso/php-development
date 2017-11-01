#!/bin/bash
docker run --rm --interactive --tty --volume $PWD:/app yopeso/php-dev:7.1-alpine composer install -d /app