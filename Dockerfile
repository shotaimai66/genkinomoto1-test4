FROM ruby:3.0.2

# 本番環境用に追加
ENV RAILS_ENV=production 

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  imagemagick \
  build-essential \
  libpq-dev \
  postgresql-client

WORKDIR /app
COPY . /app
COPY Gemfile Gemfile.lock /app/

RUN bundle install

# 本番環境用に追加
COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
