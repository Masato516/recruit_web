# buildでImageが以下から作成される
FROM ruby:2.7.1

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /recruit_web
ENV APP_ROOT /recruit_web
WORKDIR $APP_ROOT

#ホスト側からDocker側にGemfileをコピー
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
COPY . $APP_ROOT
