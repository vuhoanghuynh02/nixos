# nextcloud.nix

{ config, lib, pkgs, ... }:
{
  imports = [
    ./onlyoffice.nix
  ];

  services.cloudflared.tunnels."${config.myOptions.tunnelID}".ingress = {
    "${config.services.nextcloud.hostName}" = "http://localhost:80";
  };

  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.${config.myOptions.domainName}";
    database.createLocally = true;
    config = {
      dbtype = "pgsql";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
    notify_push = {
      enable = true;
      bendDomainToLocalhost = true;
    };
    maxUploadSize = "2G";
    settings.default_phone_region = "VN";

    extraApps =
      let
        apps = config.services.nextcloud.package.packages.apps;
        appList = [
          bookmarks
          calendar
          contacts
          integration_openai
          notify_push
          richdocuments
          twofactor_nextcloud_notification
          twofactor_webauthn
        ];
      in
      lib.listToAttrs (lib.mapAttrs' (name: _) { inherit (apps) name; } appList);
  };
}
