#!/usr/bin/env bash

hostname=$(basename "$1" .dse.in.tum.de)
report="$hostname.md"
echo -e "# ${hostname}\n" > "$report"
echo "\`\`\`" >> "$report"
ssh "$1" -- nix-shell -p inxi --command \"sudo inxi -F -i -Z -c0\" >> "$report"
echo "\`\`\`" >> "$report"
echo "wrote $report" >&2
