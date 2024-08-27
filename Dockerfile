# ベースイメージとして Ruby を使用
FROM ruby:3.3.4

# Node.js と Yarn のインストール
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs \
  && npm install --global yarn

# 作業ディレクトリの作成
WORKDIR /myapp

# Gemfile と Gemfile.lock をコピー
COPY Gemfile* ./

# Bundler のインストール
RUN gem install bundler:2.4.0
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . .

# デフォルトのコマンド
CMD ["bash"]
