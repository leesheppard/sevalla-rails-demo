#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

# --- New Debugging Checks ---
if [ -z "$SECRET_KEY_BASE" ]; then
    echo "FATAL ERROR: SECRET_KEY_BASE is NOT set. Cannot boot in production."
    exit 1
fi

if [ -z "$RAILS_MASTER_KEY" ]; then
    echo "WARNING: RAILS_MASTER_KEY is NOT set. Check if you are using encrypted credentials."
    # We allow it to continue, but if it crashes, this is the reason.
fi
# -----------------------------

echo "Starting database preparation (db:prepare)..."
bundle exec rails db:prepare

echo "Database preparation successful. Starting Thruster server (relying on 0.0.0.0 and \$PORT from environment)..."

# Use Thruster/Puma to bind to 0.0.0.0 by setting BIND_ADDRESS.
export BIND_ADDRESS="0.0.0.0"

# Execute the command
bundle exec thrust rails server
