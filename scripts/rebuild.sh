
# $1 is operation {switch, boot}
# $2 is dir
# $3 is host
# $4 is additional flag (e.g. --show-trace)

sudo mv "${2}/../.git" "${2}/../.git.backup"

sudo cp "${CONFIG_STORE_PATH}/flake.lock" "${2}"
sudo nixos-rebuild $1 --flake "${2}#${3}" $4

sudo mv "${2}/../.git.backup" "${2}/../.git"
