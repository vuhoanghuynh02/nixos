#!/usr/bin/env bash
# home-switch.sh

REPO="/home/vincent/Nextcloud/nixos"
FLAKE_DIR="${REPO}/flakes/vincent_home"
OGG_FILE="/home/vincent/Nextcloud/archive/file/alarm-clock-elapsed.ogg"

mv "${REPO}/.git" "${REPO}/.git.backup"
nix flake update --flake ${FLAKE_DIR}

home-manager -b backup switch --impure --flake "${FLAKE_DIR}#vincent"

mv "${REPO}/.git.backup" "${REPO}/.git"
mpv ${OGG_FILE}
