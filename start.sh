#!/bin/sh

if [ "${RAILS_ENV}" = "production" ]
then
    bundle exec rails assets:precompile
fi

rm -f /myapp/tmp/pids/server.pid
cd /app
bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0
