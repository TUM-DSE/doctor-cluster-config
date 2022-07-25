#!/usr/bin/env bash

user=$1

if [ -z "$user" ] ; then
    echo "Missing username"
    echo "Usage: $(basename $0) username"
    exit 1
fi

# Setup cleanup
tempfile=/tmp/tum.html
trap "rm -f $tempfile" EXIT

# Print the common part of the configuration
cat >&1 <<EOF
# File generated automatically by $(basename $0)

####################################################
####   TUM servers
####################################################

Host tunnel
     HostName login.dse.in.tum.de
     User tunnel

# default rule
Host *.dse.in.tum.de
     HostName %h
     User $user
     ForwardAgent yes
     ProxyJump tunnel

EOF

# Download list of machines
curl -s https://github.com/TUM-DSE/doctor-cluster-config/tree/master/docs/hosts > "$tempfile"
machines=$(egrep '^.+<spa.+\.md' "$tempfile" | cut -d'>' -f3 | cut -d'<' -f1 | cut -d'.' -f1)

# Generate entry for each machine
while read m; do
    if [ "$m" == "README" ] ; then continue; fi

    cat >&1<<EOF
Host $m
     HostName $m.dse.in.tum.de
     User $user
     ForwardAgent yes
     ProxyJump tunnel

EOF
done <<<"$machines"
