FROM ruby:3.1.0

RUN apt-get update -qq &&\
    apt-get install -y\
        postgresql-client\
        imagemagick\
        libvips

WORKDIR /app

# Bundler
RUN gem update --no-document
RUN gem install --no-document bundler

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY app /app/app
COPY bin /app/bin
COPY config /app/config
COPY db /app/db/
COPY lib /app/lib
COPY public /app/public
COPY storage /app/storage
COPY .ruby-version /app/
COPY config.ru /app/
COPY Rakefile /app/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
