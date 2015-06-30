FROM ruby:2.0.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN bundle install

EXPOSE 4567

CMD [ "ruby", "app.rb" ]
