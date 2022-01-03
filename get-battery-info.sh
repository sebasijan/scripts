#!/bin/bash

status=`cat /sys/class/power_supply/BAT0/status`
capacity=`cat /sys/class/power_supply/BAT0/capacity`

if [ "$status" == "Full" ]; then
    echo ""
    exit 0
else 
    if [ "$capacity" -gt 80 ]; then
        colour="#00ff00"
        battery="█"
    elif [ "$capacity" -gt 70 ]; then
        colour="#7de800"
        battery="▇"
    elif [ "$capacity" -gt 60 ]; then
        colour="#aad000"
        battery="▆"
    elif [ "$capacity" -gt 50 ]; then
        colour="#cab500"
        battery="▅"
    elif [ "$capacity" -gt 40 ]; then
        colour="#e29700"
        battery="▄"
    elif [ "$capacity" -gt 30 ]; then
        colour="#f27600"
        battery="▃"
    elif [ "$capacity" -gt 20 ]; then
        colour="#fc4f00"
        battery="▂"
    elif [ "$capacity" -gt 10 ]; then
        colour="#ff0000"
        battery="▁"
    fi
    
    echo "<fc=${colour}>${battery}</fc>"
fi


# ▁
# ▂
# 
# ▄
# 
# ▆
# ░
# █ 

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

exit 0