#!/bin/bash
# ./loop_dropbear.sh > /dev/null 2>&1 &

DROPBEAR_BIN="/home/z/dropbear-local/sbin/dropbear"
DROPBEAR_PORT="2222"
HOST_KEY="$HOME/.ssh/dropbear_rsa_host_key"

while true; do
  echo "[dropbear] starting on port $DROPBEAR_PORT..."

  "$DROPBEAR_BIN" \
    -p "$DROPBEAR_PORT" \
    -r "$HOST_KEY" \
    -F &

  DB_PID=$!
  echo "[dropbear] PID = $DB_PID"

  # wait until dropbear exits
  wait $DB_PID

  echo "[dropbear] stopped, restarting in 2s..."
  sleep 2
done
