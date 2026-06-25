#!/usr/bin/env bash

"$HOME/.local/bin/zscroll" \
  --delay 0.3 \
  --length 60 \
  --match-command "playerctl status --player=%any 2>/dev/null || echo ERROR_STATUS" \
  --match-text "Playing" "--before-text '▶ '" \
  --match-text "Paused" "--before-text '⏸ ' --scroll 0" \
  --update-check true \
  "playerctl metadata --player=%any --format '{{ artist }} - {{ title }}' 2>/dev/null || echo ERROR_META" &
wait
