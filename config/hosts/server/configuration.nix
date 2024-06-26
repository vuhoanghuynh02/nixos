# configuration.nix

{ config, ... }:
{
  imports = [
    ./options.nix
    ../../modules/nixos/server_shared.nix
  ];
  users.users.${config.custom.userName}.openssh.authorizedKeys.keyFiles = [
    ./authorized_keys/vivobook.pub
  ];
}
