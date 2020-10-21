#!/usr/bin/env bash
rm -f tmp/pids/server.pid

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

bundle exec rails server -b 0.0.0.0 -p 3000
