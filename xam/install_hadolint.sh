#!/usr/bin/bash
BIN_URL="https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64"
SHA256_URL="https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64.sha256"

rm -rf /tmp/hadolint
mkdir -p /tmp/hadolint
cd /tmp/hadolint
wget "${SHA256_URL}"
wget "${BIN_URL}"
HL="hadolint-Linux-x86_64"
#sha256sum --check --status --ignore-missing "$HL.sha256"
#sha256sum --check --ignore-missing "$HL.sha256"
RSP=$(sha256sum --check "$HL.sha256")
echo $RSP

#if [[ "$STR" =~ .*"OK".* ]]; then
if [[ "$RSP" =~ .*"OK" ]]; then
    echo "OK"
else
    echo "Sha256 (File Integrity) is Failed"
fi


# max@m20:/tmp/hadolint$ sha256sum --check  hadolint-Linux-x86_64x.sha256
# hadolint-Linux-x86_64: FAILED
# sha256sum: WARNING: 1 computed checksum did NOT match
# max@m20:/tmp/hadolint$ sha256sum --check  hadolint-Linux-x86_64.sha256
# hadolint-Linux-x86_64: OK
# max@m20:/tmp/hadolint$
