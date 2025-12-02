#!/bin/bash
set -e

# NOTE: Removed local PORT_TO_USE definition and the -p flag.
# We will rely entirely on the official $PORT variable for Puma.

echo "Starting database preparation (db:prepare)..."
bundle exec rails db:prepare

echo "Database preparation successful. Starting Thruster server (relying on 0.0.0.0 and \$PORT from environment)..."

# Use Thruster/Puma to bind to 0.0.0.0 by setting BIND_ADDRESS.
# The `config/puma.rb` will read $PORT automatically.
export BIND_ADDRESS="0.0.0.0"

# Execute the command
bundle exec thrust rails server
