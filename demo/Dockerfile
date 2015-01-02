FROM swvitaliy/orocrm
MAINTAINER Vitaliy Sverchkov "sw.vitaliy@gmail.com", Ivan Shakuta "ishakuta@gmail.com"

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get install -y php5-mcrypt && php5enmod mcrypt && \
		service apache2 restart

# prepare params
RUN cd /var/www/orocrm && cp app/config/parameters.yml.dist app/config/parameters.yml

RUN sed -i "s/^;date.timezone =$/date.timezone = \"Europe\/Moscow\"/" /etc/php5/apache2/php.ini
RUN sed -i "s/^;date.timezone =$/date.timezone = \"Europe\/Moscow\"/" /etc/php5/cli/php.ini

ADD ./orocrm_apache.conf /etc/apache2/sites-available/orocrm.conf
RUN ln -s /etc/apache2/sites-available/orocrm.conf /etc/apache2/sites-enabled/orocrm.conf
RUN a2ensite orocrm
RUN apache2ctl restart

# install
# RUN cd /var/www/orocrm && chmod -R 777 app/cache && chmod -R 777 app/logs
# RUN cd /var/www/orocrm && app/console oro:install --env=prod --user-name=admin --user-email=admin@example.com --user-firstname=John \
# 	--user-lastname=Doe --user-password=admin --sample-data=y --company-name=OroCRM --company-short-name=OroCRM
