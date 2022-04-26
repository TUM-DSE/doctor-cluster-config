#!/usr/bin/env bash

report="../graph.md"

echo '```mermaid' > "$report"
echo '  graph TD' >> "$report"

declare -A INTERFACES

for HOST in *; do
    while read -r NEIGHBOR; do
        HOST_INTERFACE=$(echo $NEIGHBOR | cut -d ' ' -f1)
        LINK_SPEED=$(echo $NEIGHBOR | cut -d ' ' -f2)
        NEIGHBOR_INTERFACE=$(echo $NEIGHBOR | cut -d ' ' -f3)
        NEIGHBOR_NAME=$(echo $NEIGHBOR | cut -d ' ' -f4)

        # remove non-alphanumeric characters from neighbor interface and name
        NEIGHBOR_INTERFACE=$(echo $NEIGHBOR_INTERFACE | tr -cd '[:alnum:]._-')
        NEIGHBOR_NAME=$(echo $NEIGHBOR_NAME | tr -cd '[:alnum:]._-')

        INTERFACES[$HOST]+=" $HOST_INTERFACE"
        INTERFACES[$NEIGHBOR_NAME]+=" $NEIGHBOR_INTERFACE"

        echo "      $HOST.$HOST_INTERFACE[\"$HOST_INTERFACE\"]-- $LINK_SPEED ---$NEIGHBOR_NAME.$NEIGHBOR_INTERFACE[\"$NEIGHBOR_INTERFACE\"]"
    done < $HOST
done >> "$report"

for HOST in "${!INTERFACES[@]}"; do
    # make interfaces unique
    INTERFACES[$HOST]=$(echo ${INTERFACES[$HOST]} | xargs -n 1 | sort -u | xargs)

    echo "      subgraph $HOST"

    for INTERFACE in ${INTERFACES[$HOST]}; do
        echo "      $HOST.$INTERFACE[\"$INTERFACE\"]"
    done

    echo "      end"
done >> "$report"

for HOST in "${!INTERFACES[@]}"; do
    if [ ! -f "../$HOST.md" ]; then
        continue
    fi

    if [[ "$PWD" =~ tum ]] || [[ "$PWD" =~ edinburgh ]]; then
        if [[ "$PWD" =~ tum ]]; then
            SITE="tum"
        else
            SITE="edinburgh"
        fi

        URL="https://github.com/TUM-DSE/doctor-cluster-config/blob/master/docs/$SITE"

        for INTERFACE in ${INTERFACES[$HOST]}; do
            echo "      click $HOST.$INTERFACE \"$URL/$HOST.md\" \"$HOST\""
        done
    fi
done >> "$report"

echo '```' >> "$report"

# remove duplicate links
while true; do
    BREAK=true

    # for every link check if there is inverse duplicate
    while read -r LINK; do
        INTERFACE_1=$(echo $LINK | awk '{print $1}' | rev | cut -c 3- | rev)
        LINK_SPEED=$(echo $LINK | awk '{print $2}')
        INTERFACE_2=$(echo $LINK | awk '{print $3}' | cut -c 4-)

        if grep -q -F "$INTERFACE_2-- $LINK_SPEED ---$INTERFACE_1" "$report"; then
            BREAK=false
            PATTERN="$INTERFACE_2-- $LINK_SPEED ---$INTERFACE_1"
            PATTERN="$(echo "$PATTERN" | sed 's:[]\[^$.*/]:\\&:g')"
            sed -i "/$PATTERN/d" "$report"
            break
        fi
    done <<< $(grep -E -- '-- [[:digit:]]{1,4}G ---' "$report")

    if $BREAK; then
        break
    fi
done

