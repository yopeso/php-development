FROM yopeso/php-development

MAINTAINER Paul RODEAN <paul.rodean@yopeso.com>
LABEL vendor="Yopeso"
LABEL version="0.1-alfa"

# Install apache2
RUN apt-get install -y \
                apache2 \
    && systemctl enable apache2.service


# Install PHP & modules
RUN apt-get install -y \
                php7.0\
                php7.0-mcrypt \
                php7.0-mysql \
                php7.0-xml \
                php7.0-curl \
                php7.0-zip \
                libapache2-mod-php7.0


# Asure that the PHP modules are enabled
RUN phpenmod mcrypt \
            xml \
            curl \
            zip


# Enable apache modules
RUN a2enmod headers \
            rewrite \
            php7.0

# Install Composer globally
RUN curl -s https://getcomposer.org/installer | php \
    # move composer into a bin directory you control:
    && mv composer.phar /usr/local/bin/composer


# Clean any source code or packages used in the install
RUN apt-get autoclean

RUN mkdir /scripts
COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*


# Set working directory
WORKDIR /var/www

ENTRYPOINT ["/scripts/entry_point.sh"]