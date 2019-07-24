#!/bin/bash

# arguments for skim sync: "%file" %line
file="$1"
line="$2"

[ "${file:0:1}" == "/" ] || file="${PWD}/${file}"
[ "${line}" == "" ] && line=1

exec osascript << EOF
  tell application "Alacritty"
    # skim runs this script immediately after clicking, so delay slightly
    # to avoid accidentally including the shift in command
    # (since script is triggered on shift command click)
    delay 0.5
    activate

    tell application "System Events"

        keystroke "c" using control down
        keystroke ":if expand('%:p') == '$file' | $line | endif" & return
        keystroke "zz"

    end tell

  end tell
EOF
