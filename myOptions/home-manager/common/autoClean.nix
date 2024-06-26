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
    nix.gc.frequency = cfg.autoClean.frequency;

    systemd.user.services.trash-empty = {
      Unit = {
        Description = "Periodic Trash Cleaning";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.trash-cli}/bin/trash-empty -f ${cfg.autoClean.age}";
      };
    };
    systemd.user.timers.trash-empty = {
      Unit = {
        Description = "Periodic Trash Cleaning";
      };
      Timer = {
        OnCalendar = cfg.autoClean.frequency;
        Persistent = true;
        Unit = "trash-empty.service";
      };
      Install = {
        WantedBy = ["timers.target"];
      };
    };
  };
}
