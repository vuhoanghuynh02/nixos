# matrix-conduit.nix

{ config, lib, pkgs, ... }:
let
  serverDomain = "matrix.${config.myOptions.domainName}";
in
{
  imports = [
    ./cloudflared.nix
  ];

  services.cloudflared.tunnels."${config.myOptions.tunnelID}".ingress = {
    "${serverDomain}" = "http://localhost:${toString config.services.matrix-conduit.settings.global.port}";
  };

  # See https://search.nixos.org/options?channel=unstable&query=services.matrix-conduit.
  # and https://docs.conduit.rs/configuration.html
  services.matrix-conduit = {
    enable = true;
    settings.global = {
      # allow_registration = true;
      server_name = serverDomain;
      address = "::1";
      database_backend = "rocksdb";
      # See https://www.metered.ca/tools/openrelay
      turn_uris = [
        "turn:staticauth.openrelay.metered.ca:80?transport=udp"
        "turn:staticauth.openrelay.metered.ca:80?transport=tcp"
      ];
      turn_secret = "openrelayprojectsecret";
    };
  };
}
