# 使用 Ruby 3.0 作为基础镜像
FROM ruby:3.0

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  curl \
  libpq-dev \
  tzdata \
  postgresql-client \
  git \
  libvips \
  pkg-config \
  python3

# 安装 Node.js 22.x 版本
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# 安装 yarn
RUN npm install -g yarn@1.22.19

# アプリケーションディレクトリの作成
RUN mkdir /myapp
WORKDIR /myapp

# GemfileとGemfile.lockをコピーして、Gemをインストール
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Yarnで前端依赖をインストール
ADD package.json yarn.lock /myapp/
RUN yarn install  # 移除 --check-files

# アプリケーションコードを追加
ADD . /myapp

# 生产环境中预编译资产
RUN bundle exec rails assets:precompile RAILS_ENV=production

# 清理缓存以减少镜像大小
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ポートの公開
EXPOSE 4000

# 设置生产环境变量
ENV RAILS_ENV=production

# Railsサーバーの起动
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4000"]
