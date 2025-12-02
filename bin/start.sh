#!/bin/bash
set -e

# ... (Optional Env Checks Here)

echo "Starting database preparation (db:prepare)..."
bundle exec rails db:prepare

# --- CRITICAL CHANGE: The log message MUST change to reflect the command ---
echo "Database preparation successful. STARTING PUMA DIRECTLY..."

# We rely on config/puma.rb reading the $PORT variable.
export BIND_ADDRESS="0.0.0.0"

# --- THE PUMA COMMAND (must be the final command) ---
bundle exec puma