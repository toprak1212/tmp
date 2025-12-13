#!/bin/bash
# ./loop_tailscaled.sh > /dev/null 2>&1 &

TS_DIR="/home/z/tailscale-sock"
TS_DAEMON="$HOME/tailscale/tailscaled"
TS_CLI="$HOME/tailscale/tailscale"
TS_SOCKET="$TS_DIR/tailscaled.sock"
TS_STATE="$TS_DIR/tailscaled.state"

AUTHKEY="tskey-auth-k89BNbC7rj11CNTRL-xzsuDXZQYHd52PXfygnDHd1DeBQquwp84"

mkdir -p "$TS_DIR"

while true; do
  echo "[tailscale] starting tailscaled (userspace)..."

  "$TS_DAEMON" \
    --tun=userspace-networking \
    --socket="$TS_SOCKET" \
    --state="$TS_STATE" &

  TS_PID=$!
  echo "[tailscale] tailscaled PID = $TS_PID"

  # wait for socket
  for i in {1..10}; do
    [ -S "$TS_SOCKET" ] && break
    sleep 1
  done

  echo "[tailscale] running tailscale up with authkey..."

  "$TS_CLI" \
    --socket="$TS_SOCKET" \
    up --authkey="$AUTHKEY" --accept-dns=false || true

  # keep alive until tailscaled exits
  wait $TS_PID

  echo "[tailscale] daemon stopped, restarting in 2s..."
  sleep 2
done