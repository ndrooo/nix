#!/usr/bin/env nu

swaymsg -t get_workspaces \
| from json
| get name
| str join "\n"
| fuzzel -d --prompt "" --mesg "Move workspace here" \
| swaymsg $"[workspace=($in)] move workspace to output current"
