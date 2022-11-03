#!/usr/bin/env bash

hostname=$(echo "$1" | cut -d"." -f"1")
report="$hostname.md"
echo -e "# ${hostname}\n" > "$report"
echo "\`\`\`" >> "$report"
if [[ "$hostname" == hinoki || "$hostname" == momiji ]]; then
  # this is an ubuntu host
  ssh "$1" -- sudo inxi -F -a -i --slots -xxx -c0 -Z -i -m >> "$report"
elif [[ "$hostname" == sarah ]]; then
  # macos does not have dmidecode
  ssh "$1" -- nix-shell -p inxi --run \"sudo inxi -F -a -i --slots -xxx -c0 -Z -i -m\" >> "$report"
  ssh "$1" -- nix-shell -p hwloc --run \"sudo lstopo /tmp/$hostname.lstopo.svg\"
  scp "$1":/tmp/$hostname.lstopo.svg ./$hostname.lstopo.svg
  ssh "$1" -- sudo rm /tmp/$hostname.lstopo.svg
else
  ssh "$1" -- nix-shell -p \'inxi.override { withRecommends = true\; }\' --run \"sudo inxi -F -a -i --slots -xxx -c0 -Z -i -m\" >> "$report"
  ssh "$1" -- nix-shell -p hwloc -p dmidecode --run \"sudo lstopo /tmp/$hostname.lstopo.svg\"
  scp "$1":/tmp/$hostname.lstopo.svg ./$hostname.lstopo.svg
  ssh "$1" -- sudo rm /tmp/$hostname.lstopo.svg
fi
echo "\`\`\`" >> "$report"
echo "![hardware topology]($hostname.lstopo.svg)" >> "$report"
echo "wrote $report" >&2
