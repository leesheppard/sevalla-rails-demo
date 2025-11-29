#!/bin/bash
bundle exec rails db:prepare
bundle exec thrust rails server -b 0.0.0.0
