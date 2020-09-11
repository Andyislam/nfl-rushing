FROM ruby:2.7.1

ENV BUNDLER_VERSION=2.1.4

RUN gem install bundler -v 2.1.4

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install libsqlite3-dev
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y nodejs



COPY . /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

RUN chmod a+x ./entrypoints/docker-entrypoint.sh

ENTRYPOINT [ "./entrypoints/docker-entrypoint.sh" ]
