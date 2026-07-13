#!/bin/bash
echo "Starting TARS AI Fusion Components..."

# Start Open WebUI and 9router in the background
open-webui serve &
9router &

echo "Systems are running in the background! You can navigate to http://localhost:8080."
echo "To shut them down, type 'pkill -f open-webui' and 'pkill -f 9router' in your terminal."
