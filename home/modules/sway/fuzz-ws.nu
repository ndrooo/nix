#!/usr/bin/env nu

swaymsg -t get_workspaces \
| from json
| get name
| str join "\n"
| fuzzel -d --prompt " ↳ " --mesg "Workspace" --cache "~/.cache/fuzzel-run" \
| swaymsg workspace $in
