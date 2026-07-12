#!/bin/sh

if [ x"$1" = x ]
then
	swaymsg -t get_workspaces | jq '.[] | .name'
else
	swaymsg "workspace $1" >/dev/null
fi
