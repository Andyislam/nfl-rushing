FROM ruby:2.7.1

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production

# Install gems, nodejs and precompile the assets
RUN bundle 

# Start the application server
ENTRYPOINT ["/entrypoint.sh"]