#!/usr/bin/env bash
# nixos-switch.sh

REPO="/home/vincent/Nextcloud/nixos"
OGG_FILE="/home/vincent/Nextcloud/archive/file/alarm-clock-elapsed.ogg"
FLAKE_DIR="${REPO}/flakes/vincent_nixos"
SCRIPT_DIR="${REPO}/scripts"

mv "${REPO}/.git" "${REPO}/.git.backup"
${SCRIPT_DIR}/delay-update.sh
nix flake update --flake ${FLAKE_DIR}

sudo nixos-rebuild switch --impure --flake "${FLAKE_DIR}#vincent"

mv "${REPO}/.git.backup" "${REPO}/.git"
mpv ${OGG_FILE}
