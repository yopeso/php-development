FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.0

USER root

RUN curl 'https://setup.ius.io/' -o setup-ius.sh && bash setup-ius.sh

RUN yum install php70u-fpm-nginx php70u-cli supervisor -y

RUN yum install php70u-mysql php70u-xml php70u-soap php70u-xmlrpc -y
RUN yum install php70u-mbstring php70u-json php70u-gd php70u-mcrypt -y
RUN yum install php70u-pdo php70u-pdo_mysql -y

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /scripts
COPY services.sh /scripts
RUN chmod +x /scripts/*

COPY supervisord.conf /etc/supervisord.conf

RUN yum -y install initscripts && yum clean all

EXPOSE 80

CMD ["/scripts/services.sh"]
