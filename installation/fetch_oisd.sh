#!/usr/bin/env bash
# fetch_oisd.sh

curl -Lo /var/lib/dnscrypt-proxy/oisd_big_domainswild.txt big.oisd.nl/domainswild
curl -Lo /var/lib/dnscrypt-proxy/oisd_nsfw_domainswild.txt nsfw.oisd.nl/domainswild
