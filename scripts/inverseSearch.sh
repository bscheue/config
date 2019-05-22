#!/bin/bash

# arguments for skim sync: "%file" %line
file="$1"
line="$2"

[ "${file:0:1}" == "/" ] || file="${PWD}/${file}"
[ "${line}" == "" ] && line=1

exec osascript << EOF
  tell application "iTerm"
    # skim runs this script immediately after clicking, so delay slightly
    # to avoid accidentally including the shift in command
    # (since script is triggered on shift command click)
    delay 0.5
    activate
    if name of current session of current window contains "vim" then
      tell application "System Events"

        keystroke "c" using control down
        keystroke ":if expand('%:p') == '$file' | $line | endif" & return
        keystroke "zz"

      end tell
    else
      launch session "Default"
      tell application "System Events"

      keystroke "n" using command down
      keystroke "vim $file" & return

      end tell

      repeat while not (name of current session of current window contains "vim")
      end repeat

      tell application "System Events"

      keystroke ":$line" & return
      keystroke "zz"

      end tell
    end if

  end tell
EOF
