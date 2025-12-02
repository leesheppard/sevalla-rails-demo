#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

PORT_TO_USE=${PORT:-3000}

echo "Starting database preparation (db:prepare)..."
# Check if $DATABASE_URL is set (Optional, but good practice)
if [ -z "$DATABASE_URL" ]; then
    echo "ERROR: DATABASE_URL environment variable is not set."
    exit 1
fi

# Run database preparation
bundle exec rails db:prepare

echo "Database preparation successful. Starting Thruster server on 0.0.0.0:$PORT_TO_USE"

# Start server
bundle exec thrust rails server -b 0.0.0.0 -p "$PORT_TO_USE"