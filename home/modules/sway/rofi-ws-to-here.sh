#!/bin/sh

if [ x"$1" = x ]
then
	swaymsg -t get_workspaces | jq '.[] | .name' | tr -d '"'
else
	swaymsg [workspace=$1] move workspace to output current >/dev/null
fi
