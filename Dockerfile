FROM ishakuta/docker-lemp
MAINTAINER Ivan Shakuta "ishakuta@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get -qy update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install openjdk-7-jre-headless
RUN apt-get -qy clean

RUN wget -O /etc/nginx/sites-available/orocrm https://raw.github.com/ishakuta/docker-orocrm/master/orocrm-site &&  ln -s /etc/nginx/sites-available/orocrm /etc/nginx/sites-enabled/orocrm
RUN sed -i 's/memory_limit = .*/memory_limit = '512M'/' /etc/php5/fpm/php.ini && sed -i 's/date\.timezone = .*/date\.timezone = 'UTC'/' /etc/php5/fpm/php.ini
RUN mkdir -p /var/www/orocrm/ && git clone https://github.com/orocrm/crm-application.git /var/www/orocrm

RUN composer install && chown www-data:www-data -R /var/www/
