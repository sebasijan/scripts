#!/bin/bash

mutedStatus=`amixer -c 0 -D pulse get Master | tail -n 1 | grep -c '\[on\]'`
volume=`amixer -D pulse get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1`

if [ "$mutedStatus" -eq 0 ]; then
    symbol="░"
else 
    symbol="█"
fi

for ((i=10;i<="$volume";i=i+10)); do
    outy="${outy}${symbol}"
done

for ((i="$volume";i<100;i=i+10)); do
    outy="${outy}■"
done

echo "$outy"

exit 0