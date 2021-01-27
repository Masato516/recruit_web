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
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT
