FROM ruby:2.3.0
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /yolo
WORKDIR /yolo
ADD Gemfile /yolo/Gemfile
ADD Gemfile.lock /yolo/Gemfile.lock
RUN bundle install
ADD . /yolo
RUN rake db:create
RUN rake db:migrate
RUN rake db:seed
ENV YOLO_GITHUB_KEY="34e96a25c2e9e6a8c48f"
ENV YOLO_GITHUB_SECRET="e6ab82624cd833bc2c36d4b669e5815ceb1fd2e8"
EXPOSE 3000
CMD rails server -p 3000 -b 0.0.0.0
