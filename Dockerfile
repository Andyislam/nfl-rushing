FROM ruby:2.7.1
LABEL MAINTAINER="andy.s.islam@gmail.com"

ENTRYPOINT [ "/entrypoint.sh" ]
COPY . /entrypoint.sh
# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

RUN chmod a+x /entrypoint.sh \
&&  cd /application \
&&  apt-get update \
&&  apt-get install -y libpq-dev \
&&  apt-get clean \
&& rm -fr /var/cache/apt \
&&  bundle install --deployment --local --without development test --with production \
&&  bundle clean \
&& rm -fr vendor/cache 