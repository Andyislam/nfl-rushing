FROM ruby:2.7.1-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk update && apk add --virtual build-dependencies sqlite-dev
RUN apk add --no-cache build-base sqlite-libs

RUN bundle config build.nokogiri --use-system-libraries
RUN gem install nokogiri


EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

COPY Gemfile /usr/src/app/
RUN bundle install

COPY . /usr/src/app



