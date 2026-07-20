#!/bin/sh

if [ x"$1" = x ]
then
	swaymsg -t get_workspaces | jq '.[] | .name' | tr -d '"'
else
    ws=${1%:*}
	swaymsg [workspace=$ws] move workspace to output current >/dev/null
fi
