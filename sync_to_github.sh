#!/bin/bash
cd ~/.config/mpv
git init
git remote add origin https://github.com/gs2sun/mpv-config.git
git add .
git commit -m "System Reboot: Perfected Path and Config"
git push -u origin main --force
