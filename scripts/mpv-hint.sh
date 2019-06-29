#!/bin/zsh
PATH=/usr/local/bin:/bin:/usr/bin::/usr/bin:/bin/usr/local/bin/mpv:/usr/local/bin/youtube-dl:${PATH}
mpv --autofit-larger=70% --pause "$1"
