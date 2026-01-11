#!/bin/bash
source /usr/local/rvm/scripts/rvm
cd /home/app/concerto
export BUNDLE_PATH=/home/app/concerto/vendor/bundle
export BUNDLE_GEMFILE=/home/app/concerto/Gemfile
exec /usr/local/rvm/rubies/ruby-2.6.10/bin/ruby "$@"
