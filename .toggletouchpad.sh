#!/usr/bin/env bash

touchpadEnabled=$(xinput list-props 11 | grep "Device Enabled" | awk -F ":" '{print $2}')
if [ $touchpadEnabled -eq 1 ]
then
    xinput --set-prop 11 "Device Enabled" 0
else
    xinput --set-prop 11 "Device Enabled" 1
fi
