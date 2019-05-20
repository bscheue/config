
file="$1"
line="$2"

[ "${file:0:1}" == "/" ] || file="${PWD}/${file}"
[ "${line}" == "" ] && line=1

exec osascript << EOF
  tell application "iTerm"
  delay 1
  activate
  if name of current session of current window contains "vim" then
  tell application "System Events"
  # keystroke "j"

  # keystroke "ESC" & ":set hidden" & return
  # keystroke ":if bufexists(\'$file\')" & return
  # keystroke ":exe \":buffer \" . bufnr(\'$file\')"  & return
  # keystroke ":else " & CR
  # keystroke ":    edit ${file// /\ }" & return
  # keystroke ":endif" & return
  # keystroke ":$line" & return
  # if name of current session contains "vim" then
  keystroke "c" using control down
  keystroke ":if expand('%:p') == '$file' | $line | endif" & return
  keystroke "zz"

  end tell
  end if
  end tell
 EOF
