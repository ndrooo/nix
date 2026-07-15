#!/bin/sh

if [ x"$1" = x ]
then
	swaymsg -t get_workspaces | jq '.[] | .name' | tr -d '"'
else
	swaymsg "move container to workspace $1" >/dev/null
fi
