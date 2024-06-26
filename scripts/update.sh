#!/usr/bin/env bash
# update.sh

nix flake update --flake /home/vincent/Nextcloud/nixos/flakes/shared
sudo nix-channel --update

mkdir -p /home/vincent/Nextcloud/nixos/.tmp
curl -Lo /home/vincent/Nextcloud/nixos/.tmp/oisd_big.txt big.oisd.nl/domainswild
curl -Lo /home/vincent/Nextcloud/nixos/.tmp/oisd_nsfw.txt nsfw.oisd.nl/domainswild