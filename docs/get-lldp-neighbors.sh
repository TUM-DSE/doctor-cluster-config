#!/usr/bin/env bash

hostname=$(echo "$1" | cut -d"." -f"1")
report="$hostname"

lldp=$(ssh "$1" -- networkctl lldp --full --no-pager --no-legend)

while read -r NEIGHBOR; do
    INTERFACE=$(echo $NEIGHBOR | cut -d ' ' -f1)
    NEIGHBOR_CHASSIS_ID=$(echo $NEIGHBOR | cut -d ' ' -f2)
    NEIGHBOR_NAME=$(echo $NEIGHBOR | cut -d ' ' -f3)
    LINK_SPEED=$(ssh "$1" -- cat /sys/class/net/"$INTERFACE"/speed < /dev/null)

    # search for chassis id
    NEIGHBOR_INTERFACE=$(grep -d skip -E "IF: [[:alnum:]:[:space:]]* mac: $NEIGHBOR_CHASSIS_ID" ../*)

    # replace chassis id and neighbor name if mac address is known
    if [ -n "$NEIGHBOR_INTERFACE" ]; then
        NEIGHBOR_NAME=$(echo $NEIGHBOR_INTERFACE | cut -d '/' -f2 | cut -d '.' -f1)
        NEIGHBOR_CHASSIS_ID=$(echo $NEIGHBOR_INTERFACE | awk '{print $3}')
    fi

    echo "$INTERFACE ${LINK_SPEED::-3}G $NEIGHBOR_CHASSIS_ID $NEIGHBOR_NAME"
done <<< "${lldp}" > "$report"

echo "wrote $report" >&2
