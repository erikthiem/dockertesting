FROM ruby:2.7.3

WORKDIR /opt/app
COPY Gemfile /opt/app/Gemfile
COPY Gemfile.lock /opt/app/Gemfile.lock
RUN bundle install
COPY . /opt/app

# Fixes a Rails/Docker issue
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
