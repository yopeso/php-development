# php-dev docker setup

- `build-php-dev.sh` creates a docker image with:
    - php
    - xdebug
    - composer
    - phan
- `build-project.sh` runs `composer install` the docker image 
