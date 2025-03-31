#!/usr/bin/env bash
# Exit immediately if any command fails
set -o errexit

# Install dependencies
bundle install && bundle exec rake db:create db:migrate