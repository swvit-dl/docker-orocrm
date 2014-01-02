FROM ishakuta/docker-orocrm
MAINTAINER Ivan Shakuta "ishakuta@gmail.com"

# prepare params
RUN cp app/config/parameters_dist.yml app/config/parameters.yml

# TODO: create db

# install
RUN app/console oro:install --env=prod --user-name=admin --user-email=admin@example.com --user-firstname=John --user-lastname=Doe --user-password=admin --sample-data=y --company-name=OroCRM --company-short-name=OroCRM
