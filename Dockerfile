FROM ruby:2.2.0
MAINTAINER tuxedio <tuxedoapp@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RAIS_ENV production
ENV PORT 5000

RUN apt-get update && apt-get install -y \
      git

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install \
      --without development:test \
      --jobs=3 \
      --retry=3

ADD . /usr/src/app/

EXPOSE 3000

CMD ["bundle", "exec", "foreman", "start"]
