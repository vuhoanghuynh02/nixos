#!/usr/bin/env bash
# delay-update.sh

LOCK_PATH="/home/vincent/Nextcloud/nixos/flakes/shared/flake.lock"
UPDATE="bash /home/vincent/Nextcloud/nixos/scripts/update.sh"
MAX_AGE=70

# Check if the file exists
if [ ! -f "$LOCK_PATH" ]; then
  $UPDATE
  exit 0
fi

LAST_MODIFIED=$(stat -c %Y "$LOCK_PATH")
CURRENT_TIME=$(date +%s)
AGE_DAYS=$(( (CURRENT_TIME - LAST_MODIFIED) / 86400 ))
echo "Age is $AGE_DAYS days"

if [ "$AGE_DAYS" -gt $MAX_AGE ]; then
  $UPDATE
fi