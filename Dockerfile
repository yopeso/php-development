FROM debian:jessie-slim

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update -qq && \
    apt-get -y install nginx && \
    apt-get -y install supervisor

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list && \
    echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install php7.0-fpm \
                    php7.0-gd \
                    php7.0-curl \
                    php7.0-mcrypt \
                    php7.0-mysql \
                    php7.0-pgsql \
                    php7.0-mbstring \
                    php7.0-xml \
                    php7.0-soap \
                    -y --allow-unauthenticated

RUN mkdir /scripts
COPY services.sh /scripts
RUN chmod +x /scripts/*

COPY supervisord.conf /etc/supervisord.conf

RUN apt-get autoclean

EXPOSE 80

CMD ["/scripts/services.sh"]



