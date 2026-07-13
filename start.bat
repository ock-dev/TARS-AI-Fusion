@echo off
title TARS AI Fusion Launcher
echo Starting TARS AI Fusion Components...

echo Starting Open WebUI...
start cmd /k "open-webui serve"

echo Starting 9router...
start cmd /k "9router"

echo Systems are active! You can navigate to http://localhost:8080 in your browser.
