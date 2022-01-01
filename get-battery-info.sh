#!/bin/bash

status=`cat /sys/class/power_supply/BAT0/status`
capacity=`cat /sys/class/power_supply/BAT0/capacity`

if [ "$status" == "Full" ]; then
    outy="████■"
else 
    if [ "$status" == "Discharging" ]; then
        outy="▒"
        symbol="▒"
    else
        outy="█"
        symbol="█"
    fi

    for ((i=25;i<="$capacity";i=i+25)); do
        outy="${outy}${symbol}"
    done

    for ((i="$capacity";i<100;i=i+25)); do
        outy="${outy}■"
    done
fi

echo "$outy"
# if [ ! "$capacity" -eq 100 ]; then
#     echo "[${capacity}]"
# else
#     echo "▄ █ ▓ ▒ ░ _ ‗ ≡ ═"
# fi
exit 0