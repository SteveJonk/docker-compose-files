#!/bin/bash

# Set a dynamic DISPLAY if not already set
if [ -z "$DISPLAY" ]; then
  export DISPLAY=:99
fi

# Define a marker for Xvfb to detect its specific instance
XVFB_MARKER="/tmp/.Xvfb_$DISPLAY"

# Check if the Xvfb marker exists
if [ -f "$XVFB_MARKER" ]; then
  echo "Cleaning up stale Xvfb process on $DISPLAY."
  pkill -f "Xvfb $DISPLAY"
  rm -f "$XVFB_MARKER"
fi

# Start Xvfb with the marker
echo "Starting Xvfb on $DISPLAY."
Xvfb $DISPLAY -screen 0 1280x1024x24 &
echo $! > "$XVFB_MARKER"

# Execute the main container command
exec "$@"