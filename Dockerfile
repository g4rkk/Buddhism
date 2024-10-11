FROM ruby:3.0-alpine

# 必要なパッケージをインストール
RUN apk update && \
    apk upgrade && \
    apk add --no-cache gcompat && \
    apk add --no-cache \
      linux-headers \
      libxml2-dev \
      make \
      gcc \
      g++ \ 
      libc-dev \
      nodejs \
      tzdata \
      postgresql-dev \
      postgresql \
      git \
      bash \
      build-base \
      curl-dev \
      libsass-dev \
      libffi-dev \
      yaml-dev

# アプリケーションディレクトリの作成
RUN mkdir /myapp
WORKDIR /myapp

# GemfileとGemfile.lockをコピーして、Gemをインストール
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# ビルドツールを削除
RUN apk del build-base

# アプリケーションコードを追加
ADD . /myapp

# ポートの公開
EXPOSE 4000

# Railsサーバーの起動
CMD ["rails", "server", "-b", "0.0.0.0"]
