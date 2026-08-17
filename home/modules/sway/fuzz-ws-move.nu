#!/usr/bin/env nu

swaymsg -t get_workspaces \
| from json
| get name
| str join "\n"
| fuzzel -d --prompt " ↳ " --mesg "Move to workspace" \
| swaymsg move container to workspace $in
