FROM ruby:2.7.1

ENTRYPOINT [ "./entrypoints/docker-entrypoint.sh" ]

COPY . /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN chmod a+x ./entrypoints/docker-entrypoint.sh \
&& 	bundle config build.nokogiri --use-system-libraries \
&&  cd /app \
&&  apt-get update \
&&  apt-get install -y libpq-dev yarn\
&&  apt-get clean \
&& rm -fr /var/cache/apt \
&& bundle check || bundle install  \
&& rm -fr vendor/cache 

