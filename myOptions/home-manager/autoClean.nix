# autoClean.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    nix.gc.frequency = config.myOptions.autoClean.frequency;

    systemd.user.services.trash-empty = {
      Unit = {
        Description = "Periodic Trash Cleaning";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.trash-cli}/bin/trash-empty -f ${config.myOptions.autoClean.age}";
      };
    };
    systemd.user.timers.trash-empty = {
      Unit = {
        Description = "Periodic Trash Cleaning";
      };
      Timer = {
        OnCalendar = config.myOptions.autoClean.frequency;
        Persistent = true;
        Unit = "trash-empty.service";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
