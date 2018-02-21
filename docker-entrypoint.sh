#!/bin/bash
set -e

rake db:migrate
rake redmine:plugins:migrate

exec "$@"
