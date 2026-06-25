#!/usr/bin/env bash

zscroll \
  --before-text "♪ " \
  --delay 0.3 \
  --length 40 \
  --match-command "playerctl status --player=%any 2>/dev/null" \
  --match-text "Playing" "--before-text '▶ '" \
  --match-text "Paused" "--before-text '⏸ ' --scroll 0" \
  --update-check true \
  "playerctl metadata --player=%any --format '{{ artist }} - {{ title }}' 2>/dev/null" &
wait
