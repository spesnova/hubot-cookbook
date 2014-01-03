#!/bin/sh
#
# bootstrap
#
# Prepare test environment.

set -e

#
# Check for Bundler
#
if test ! $(which bundle)
then
  echo "  x You need to install Bundler:"
  echo "    gem install bundler"
  exit
else
  echo "  + Bundler found."
fi

#
# Install gems
#
echo "  + Bootstrapping your Rubies."
bundle install --binstubs --local --path vendor/gems --quiet

#
# Generate data bag items
#
echo "  + Generating data bag items for test-kitchen."
if test ! -d test/integration/default/data_bags/deploy_keys
then
  mkdir test/integration/default/data_bags/deploy_keys
fi
knife data bag show deploy_keys my-hubot -Fj \
  --secret-file ~/.chef/encrypted_data_bag_secret \
  > test/integration/default/data_bags/deploy_keys/my-hubot.json

exit 0
