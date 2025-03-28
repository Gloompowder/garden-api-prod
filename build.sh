#!/usr/bin/env bash
# Exit immediately if any command fails
set -o errexit

# Install dependencies
bundle install

# Run database migrations
bundle exec rails db:migrate

# Precompile assets for production
bundle exec rails assets:precompile