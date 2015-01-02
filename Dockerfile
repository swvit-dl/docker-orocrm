FROM tutum/lamp
MAINTAINER Vitaliy Sverchkov "sw.vitaliy@gmail.com", Ivan Shakuta "ishakuta@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get -qy update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install nodejs

RUN apt-get -qy clean

# ADD ./orocrm-site /etc/nginx/sites-available/orocrm
# RUN ln -s /etc/nginx/sites-available/orocrm /etc/nginx/sites-enabled/orocrm

# RUN sed -i 's/memory_limit = .*/memory_limit = '512M'/' /etc/php5/fpm/php.ini && \
#     sed -i 's/;date\.timezone =/date\.timezone = 'UTC'/' /etc/php5/fpm/php.ini

RUN mkdir -p /var/www/orocrm/ && \
    git clone -b 1.3.0 https://github.com/orocrm/crm-application.git /var/www/orocrm && \
    ln -s /var/www/orocrm /var/www/orocrm.local

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-intl php5-gd php5-curl

ADD ./.vendor /var/www/orocrm/vendor

ADD ./composer_install.sh /composer_install.sh
RUN chmod +x /composer_install.sh
RUN /composer_install.sh

RUN chown www-data:www-data -R /var/www/
