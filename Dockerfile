FROM alpine:3.2
MAINTAINER Nakul Pathak <nakulpathak3@hotmail.com>


ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /personal-website-rails/Gemfile
ADD Gemfile.lock /personal-website-rails/Gemfile.lock
RUN bundle install

ADD . /personal-website-rails
