FROM ruby:3.1.2-slim as builder
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential git libxml2 libxml2-dev libcurl4-openssl-dev sqlite3 libsqlite3-dev && apt-get clean
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

FROM ruby:3.1.2-slim
RUN apt-get update -qq && apt-get install -y sqlite3 libsqlite3-dev && apt-get clean
COPY --from=builder /usr/local/bundle /usr/local/bundle
RUN mkdir /myapp
COPY . /myapp
WORKDIR /myapp

RUN mkdir -p ./tmp/sockets
RUN mkdir -p ./tmp/pids
VOLUME ./tmp

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]