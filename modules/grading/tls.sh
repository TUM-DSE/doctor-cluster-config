#!/usr/bin/env bash
set -eu
cd "${STATE_DIRECTORY:-/var/lib/grading-tls}"
umask 077

# Keep the CA stable across reboots and server-certificate renewals.
# Never silently replace a missing half of an existing CA identity.
if [ ! -e ca.key ] && [ ! -e ca.crt ]; then
  openssl req -x509 -newkey rsa:3072 -nodes -sha256 -days 3650 \
    -subj '/CN=SRG grading internal CA' \
    -addext 'basicConstraints=critical,CA:TRUE,pathlen:0' \
    -addext 'keyUsage=critical,keyCertSign,cRLSign' \
    -keyout ca.key -out ca.crt
fi
test -s ca.key
openssl x509 -in ca.crt -noout -checkend 2592000

if [ -s "$GRADING_PRIVATE_KEY" ] && [ -s "$GRADING_CERTIFICATE" ] &&
   openssl x509 -in "$GRADING_CERTIFICATE" -noout -checkend 2592000 &&
   openssl verify -CAfile ca.crt -verify_hostname "$GRADING_HOSTNAME" "$GRADING_CERTIFICATE"; then
  valid=true
else
  valid=false
fi

if [ "$valid" = false ]; then

if [ ! -s "$GRADING_PRIVATE_KEY" ]; then
  openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:3072 -out "$GRADING_PRIVATE_KEY"
fi
openssl req -new -key "$GRADING_PRIVATE_KEY" -subj "/CN=$GRADING_HOSTNAME" -out server.csr
printf '%s\n' \
  'basicConstraints=critical,CA:FALSE' \
  'keyUsage=critical,digitalSignature,keyEncipherment' \
  'extendedKeyUsage=serverAuth' \
  "subjectAltName=DNS:$GRADING_HOSTNAME" > server.ext
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key \
  -set_serial "0x$(openssl rand -hex 16)" -days 90 -sha256 \
  -extfile server.ext -out "$GRADING_CERTIFICATE.new"
mv "$GRADING_CERTIFICATE.new" "$GRADING_CERTIFICATE"

fi

chgrp nginx ca.crt server.crt server.key
chmod 0640 ca.crt server.crt server.key

# Nonblocking avoids a dependency cycle during nginx's initial start.
if systemctl is-active --quiet nginx.service; then
  systemctl reload --no-block nginx.service
fi
