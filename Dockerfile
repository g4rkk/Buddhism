FROM ruby:3.0

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  curl \
  libpq-dev \
  nodejs \
  tzdata \
  postgresql-client \
  git \
  libvips \
  pkg-config \
  python3

# アプリケーションディレクトリの作成
RUN mkdir /myapp
WORKDIR /myapp

# GemfileとGemfile.lockをコピーして、Gemをインストール
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# アプリケーションコードを追加
ADD . /myapp

# ポートの公開
EXPOSE 4000

# Railsサーバーの起動
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4000"]
