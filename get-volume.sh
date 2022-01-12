#!/bin/bash

mutedStatus=`amixer -c 0 -D pulse get Master | tail -n 1 | grep -c '\[on\]'`
volume=`amixer -D pulse get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1`

if [ "$mutedStatus" -eq 0 ]; then
    colour="#595958"
else 
    colour="#FFFFFF"
fi

full="┃"
half="╽"
empty="┊"

case "$volume" in
    0)
        pattern="${empty}${empty}${empty}${empty}${empty}";;
    10)
        pattern="${half}${empty}${empty}${empty}${empty}";;
    20)
        pattern="${full}${empty}${empty}${empty}${empty}";;
    30)
        pattern="${full}${half}${empty}${empty}${empty}";;
    40)
        pattern="${full}${full}${empty}${empty}${empty}";;
    50)
        pattern="${full}${full}${half}${empty}${empty}";;
    60)
        pattern="${full}${full}${full}${empty}${empty}";;
    70)
        pattern="${full}${full}${full}${half}${empty}";;
    80)
        pattern="${full}${full}${full}${full}${empty}";;
    90)
        pattern="${full}${full}${full}${full}${half}";;
    100)
        pattern="${full}${full}${full}${full}${full}";;
    *)
        pattern="${full}${volume}${full}";;
esac

echo "<fc=${colour}>${pattern}</fc>"

exit 0