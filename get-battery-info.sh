#!/bin/bash

# icons from https://www.utf8icons.com/subsets
# gradient generator
# 
# cat /sys/class/power_supply/BAT0/status && cat /sys/class/power_supply/BAT0/capacity

status=`cat /sys/class/power_supply/BAT0/status`
capacity=`cat /sys/class/power_supply/BAT0/capacity`

if [ "$status" == "Full" ]; then
    outy=" █"
else 
    if [ "$capacity" -gt 90 ]; then
        colour="#00ff00"
        battery="█"
    elif [ "$capacity" -gt 80 ]; then
        colour="#6fed00"
        battery="▇"
    elif [ "$capacity" -gt 70 ]; then
        colour="#98db00"
        battery="▆"
    elif [ "$capacity" -gt 60 ]; then
        colour="#b6c700"
        battery="▅"
    elif [ "$capacity" -gt 50 ]; then
        colour="#cdb200"
        battery="▄"
    elif [ "$capacity" -gt 40 ]; then
        colour="#df9b00"
        battery="▃"
    elif [ "$capacity" -gt 30 ]; then
        colour="#ee8200"
        battery="▂"
    elif [ "$capacity" -gt 20 ]; then
        colour="#f86600"
        battery="▁"
    elif [ "$capacity" -gt 10 ]; then
        colour="#fe4400"
        battery="_"
    elif [ "$capacity" -gt 10 ]; then
        colour="#ff0000"
        battery="!!"
    fi

    if [ "$status" == "Charging" ]; then
        prefix="⚡"
    else
        prefix=" "
    fi

    outy="<fc=${colour}>${prefix}${battery}</fc>"
fi

echo "${outy}"
exit 0

# █▇▆▅▄▃▂▁_

# if [ "$status" == "Full" ]; then
#     # outy="████"
#     echo ""
#     exit 0
# else 
#     if [ "$status" == "Discharging" ]; then
#         outy="▒"
#         symbol="▒"
#     else
#         outy="█"
#         symbol="█"
#     fi

#     for ((i=25;i<="$capacity";i=i+25)); do
#         outy="${outy}${symbol}"
#     done

#     for ((i="$capacity";i<100;i=i+25)); do
#         outy="${outy}"
#     done
# fi

# echo "${outy}■"