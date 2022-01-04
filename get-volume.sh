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
        echo "<fc=${colour}>${empty}${empty}${empty}${empty}${empty}</fc>";;
    10)
        echo "<fc=${colour}>${half}${empty}${empty}${empty}${empty}</fc>";;   
    20)
        echo "<fc=${colour}>${full}${empty}${empty}${empty}${empty}</fc>";;
    30)
        echo "<fc=${colour}>${full}${half}${empty}${empty}${empty}</fc>";;
    40)
        echo "<fc=${colour}>${full}${full}${empty}${empty}${empty}</fc>";;
    50)
        echo "<fc=${colour}>${full}${full}${half}${empty}${empty}</fc>";;   
    60)
        echo "<fc=${colour}>${full}${full}${full}${empty}${empty}</fc>";;
    70)
        echo "<fc=${colour}>${full}${full}${full}${half}${empty}</fc>";;
    80)
        echo "<fc=${colour}>${full}${full}${full}${full}${empty}</fc>";;
    90)
        echo "<fc=${colour}>${full}${full}${full}${full}${half}</fc>";;
    100)
        echo "<fc=${colour}>${full}${full}${full}${full}${full}</fc>";;
esac

# ${half}${full}┊${empty}

# if [ "$mutedStatus" -eq 0 ]; then
#     symbol="░"
# else 
#     symbol="█"
# fi

# for ((i=10;i<="$volume";i=i+10)); do
#     outy="${outy}${symbol}"
# done

# for ((i="$volume";i<100;i=i+10)); do
#     outy="${outy}■"
# done

# echo "$outy"

exit 0