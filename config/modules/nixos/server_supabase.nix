# server_supabase.nix

{ config, lib, pkgs, ... }:
let
  workingDir = "${config.custom.homeDirectory}/supabase/docker";
  git = "${pkgs.git}/bin/git -C ${workingDir}";
  podman-compose = "${pkgs.podman-compose}/bin/podman-compose -f ${workingDir}/docker-compose.yml --env-file ${workingDir}/.env";
  supabase-restart = pkgs.writeScriptBin "supabase-restart" ''
    #!${pkgs.bash}/bin/bash
    set -e
    ${podman-compose} down
    ${podman-compose} up -d
  '';
  supabase-upgrade = pkgs.writeScriptBin "supabase-upgrade" ''
    #!${pkgs.bash}/bin/bash
    set -e
    ${git} fetch
    ${git} checkout $(${git} describe --abbrev=0 --tags)
    ${podman-compose} pull
    ${supabase-restart}
  '';
in
{
  systemd.services.supabase-autostart = {
    description = "Restart Supabase containers";
    after = [
      "podman.service"
    ];
    requires = [
      "podman.service"
    ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${supabase-restart}/bin/supabase-restart";
      Environment = "PATH=${pkgs.podman}/bin";
      User = config.custom.userName;
      Restart = "on-failure";
      RestartSec = 10;
    };
  };

  systemd.timers.supabase-upgrade = {
    timerConfig = {
      OnCalendar = config.nix.gc.dates;
      Persistent = true;
    };
    wantedBy = [ "timers.target" ];
  };
  systemd.services.supabase-upgrade = {
    description = "Upgrade Supabase";
    after = [
      "network-online.target"
      "podman.service"
    ];
    requires = [
      "network-online.target"
      "podman.service"
    ];
    serviceConfig = {
      ExecStart = "${supabase-upgrade}/bin/supabase-upgrade";
      Environment = "PATH=${pkgs.podman}/bin";
      User = config.custom.userName;
      Restart = "on-failure";
      RestartSec = 10;
    };
  };
}
