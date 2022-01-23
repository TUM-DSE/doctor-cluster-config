#!/usr/bin/env bash

hostname=$(basename "$1" .dse.in.tum.de)
report="$hostname.md"
echo -e "# ${hostname}\n" > "$report"
echo "\`\`\`" >> "$report"
if [[ "$hostname" == hinoki ]]; then
  ssh "$1" -- sudo inxi -F -i --slots -xxx -c0 -Z -i -m >> "$report"
else
  ssh "$1" -- nix-shell -p inxi -p dmidecode --command \"sudo inxi -F -i --slots -xxx -c0 -Z -i -m\" >> "$report"
fi
echo "\`\`\`" >> "$report"
echo "wrote $report" >&2
