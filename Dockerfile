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
RUN yarn install

# 应用代码
ADD . /myapp

# 添加 RAILS_MASTER_KEY 参数
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

# 使用 yarn build 进行 Webpack 资产编译，而不是使用 rails assets:precompile
RUN yarn build

# 清理缓存以减少镜像大小
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ポートの公開
EXPOSE 4000

# 设置开发环境变量
ENV RAILS_ENV=development

# Railsサーバーの起动
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4000"]
