FROM ruby:2.4.2
MAINTAINER johan.tique@analisistem.com

ARG APP_DIR=/user-server-app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libreadline-dev nodejs

# Setup app directory.
RUN mkdir $APP_DIR

WORKDIR $APP_DIR

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4 --retry 5

# Copy the main application.
COPY . ./

# Copy secrets and DB config files
COPY config/mongoid.yml.example ./config/mongoid.yml

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# Configure an entry point, so we don't need to specify
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["rails", "server", "-b", "0.0.0.0"]
