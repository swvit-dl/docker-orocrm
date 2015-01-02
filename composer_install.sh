#!/bin/bash

php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer
/usr/local/bin/composer self-update

GITHUB_OAUTH_TOKEN='c88fa1c2b6caaa3bdae8df8293f579cb3d656abf'

cd /var/www/orocrm && git checkout 1.3
cp /var/www/orocrm/composer.json /var/www/orocrm/composer.origin.json
cd /var/www/orocrm && \
	php -r '$c=json_decode(file_get_contents(__DIR__ . "/composer.json"),1);
	$c["config"]=array("github-oauth"=>array("github.com"=>"'$GITHUB_OAUTH_TOKEN'"));
	file_put_contents(__DIR__ . "/composer.json", json_encode($c));'

echo '> cat composer.json'
cd /var/www/orocrm && cat /var/www/orocrm/composer.json

composer update

