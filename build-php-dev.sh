#!/bin/bash
docker build . --build-arg BASE=php:7.1-alpine -t yopeso/php-dev:7.1-alpine