#!/usr/bin/env bash

## globals
# all of the image URL will be saved/overwritten here
SAVE_PATH="$HOME/.config/eww/cache/eww-album-art.png"
# if no players are running, the following image will be displayed instead
DEFAULT_SAVE_PATH="cache/eww-album-art-default.svg"
STATUS=$(playerctl status)

# if status is playing then albumart will be fetched and displayed
# else the default image will be displayed
if [[ ! "$STATUS" ]]; then
    echo "$DEFAULT_SAVE_PATH"
else
    ## note that I only use spotify so the following really works well for me
    ## if you use offline players then you'd need to implement the code yourself
    curl "$(playerctl metadata mpris:artUrl)" > "$SAVE_PATH"
    echo "$SAVE_PATH"
fi

# vim:ft=bash:nowrap
