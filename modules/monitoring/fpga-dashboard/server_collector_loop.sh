#!/run/current-system/sw/bin/bash
# Run server_collector.sh every 10 seconds
while true; do
    /scratch/anubhav/monitor/server_collector.sh 2>/dev/null
    sleep 10
done
