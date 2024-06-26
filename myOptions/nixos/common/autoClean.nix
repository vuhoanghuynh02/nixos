# autoClean.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions;
in {
  config = {
    nix.settings.auto-optimise-store = mkDefault true;
    nix.gc.dates = cfg.autoClean.frequency;

    systemd.services.trash-empty = {
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.trash-cli}/bin/trash-empty -f --all-users ${cfg.autoClean.age}";
      };
    };
    systemd.timers.trash-empty = {
      timerConfig = {
        OnCalendar = cfg.autoClean.frequency;
        Persistent = true;
        Unit = "trash-empty.service";
      };
      wantedBy = ["timers.target"];
    };
  };
}
