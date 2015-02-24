FROM ruby:2.2.0
MAINTAINER tuxedio <tuxedoapp@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
      git

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install \
      --jobs=3 \
      --retry=3

ADD . /usr/src/app/

CMD ["bundle", "exec", "foreman", "start"]
