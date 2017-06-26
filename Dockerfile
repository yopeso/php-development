FROM yopeso/php-development

MAINTAINER Paul RODEAN <paul.rodean@yopeso.com>
LABEL vendor="Yopeso"
LABEL version="0.1-alfa"
# Install PHP fpm & Co
RUN apt-get install -y \
                php7.0 \
                php7.0-fpm \
                php7.0-mcrypt \
                php7.0-mysql \
                php7.0-xml \
                php7.0-curl \
                php7.0-zip \
                php7.0-mbstring \
                php7.0-gd \
    && systemctl enable php7.0-fpm.service

# Asure that the PHP modules are enabled
RUN phpenmod mcrypt \
            mbstring \
            xml \
            curl \
            zip



# Install nginx
RUN apt-get install -y \
                nginx \
    && systemctl enable nginx.service


# Install required dependecies for app build
RUN apt-get install -y \
                nodejs \
                git \
                subversion \
                unzip \
                curl

# Install Composer globally
RUN curl -s https://getcomposer.org/installer | php \
    # move composer into a bin directory you control:
    && mv composer.phar /usr/local/bin/composer

RUN	mkdir -p /run/php

# PHP - fpm configs
COPY ./php7/fpm/php.ini /etc/php/7.0/fpm/php.ini
COPY ./php7/fpm/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
COPY ./php7/fpm/pool.d /etc/php/7.0/fpm/pool.d

# Nginx configs (Default)
COPY ./nginx/sites-enabled/default /etc/nginx/sites-enabled/default
COPY ./nginx/ssl/* /etc/nginx/ssl/


# Clean any source code or packages used in the install
RUN apt-get autoclean

RUN mkdir /scripts
COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*

COPY ./test-file/index.php /var/www/html/

# Set working directory
WORKDIR /var/www

ENTRYPOINT ["/scripts/entry_point.sh"]