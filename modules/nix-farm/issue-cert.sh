#!/usr/bin/env bash
# Issue a certificate from the farm CA (docs/nix-farm.md).
#
#   issue-cert.sh worker <host> <ip>            # a farm node
#   issue-cert.sh lb <host> <ip> [dns-name...]  # the balancer
#
# The certificate goes to certs/<kind>-<host>.crt, its key into
# hosts/<host>.yml as nix-farm-<kind>-key. The first run also creates the CA.
set -euo pipefail

kind=$1 host=$2 ip=$3
shift 3
case $kind in worker | lb) ;; *)
  echo "kind must be worker or lb" >&2
  exit 1
  ;;
esac

here=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
root=$(cd "$here/../.." && pwd)
cd "$root"

# sops matches creation rules against the path, so the plaintext is written
# to its final name and encrypted in place; the trap removes a leftover.
tmp=$(mktemp -d -p /dev/shm)
ca=modules/nix-farm/ca.yml
cleanup() {
  rm -rf "$tmp"
  if [[ -e $ca ]] && ! grep -q '^sops:' "$ca"; then rm -f "$ca"; fi
}
trap cleanup EXIT
umask 077

mkdir -p "$here/certs"
if [[ ! -e $ca ]]; then
  openssl req -x509 -newkey rsa:4096 -nodes -keyout "$tmp/ca.key" -out "$here/certs/ca.crt" \
    -days 3650 -sha256 -subj "/CN=TUM DSE nix-farm CA" \
    -addext "basicConstraints=critical,CA:TRUE" -addext "keyUsage=critical,keyCertSign,cRLSign"
  jq -n --rawfile key "$tmp/ca.key" '{"ca-key": $key}' >"$ca"
  sops encrypt --in-place --input-type json --output-type yaml "$ca"
fi
sops decrypt --extract '["ca-key"]' "$ca" >"$tmp/ca.key"

san="DNS:$host.dos.cit.tum.de,IP:$ip"
for name in "$@"; do san+=",DNS:$name"; done

openssl req -newkey rsa:3072 -nodes -keyout "$tmp/key" -subj "/CN=$kind-$host" -out "$tmp/csr"
openssl x509 -req -in "$tmp/csr" -CA "$here/certs/ca.crt" -CAkey "$tmp/ca.key" \
  -set_serial "0x$(openssl rand -hex 16)" -days 3650 -sha256 \
  -extfile <(printf 'subjectAltName=%s' "$san") -out "$here/certs/$kind-$host.crt"

sops set "hosts/$host.yml" "[\"nix-farm-$kind-key\"]" "$(jq -Rs . <"$tmp/key")"
