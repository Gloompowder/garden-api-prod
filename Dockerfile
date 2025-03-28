# syntax = docker/dockerfile:1
FROM ruby:3.1.2-slim

# Set core environment
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development:test \
    LD_PRELOAD=libjemalloc.so.2

    # Install dependencies
    RUN apt-get update -qq && \
        apt-get install -y \
        build-essential \
        curl \
        libpq-dev \
        postgresql-client \
        git \  # Needed for any gem installations from git
        && rm -rf /var/lib/apt/lists/*

# Configure application home
WORKDIR /rails

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ $BUNDLE_PATH/ruby/*/cache

# Copy application
COPY . .

# Precompile assets
RUN bundle exec rails assets:precompile

# Security setup
RUN useradd -m -u 1000 rails && \
    chown -R rails:rails /rails && \
    chmod 700 /rails/tmp /rails/log
USER rails

# Runtime config
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]