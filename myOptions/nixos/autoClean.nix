# autoClean.nix

{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    nix.settings.auto-optimise-store = lib.mkDefault true;
    nix.gc.dates = config.myOptions.autoClean.frequency;

    systemd.services.trash-empty = {
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.trash-cli}/bin/trash-empty -f --all-users ${config.myOptions.autoClean.age}";
      };
    };
    systemd.timers.trash-empty = {
      timerConfig = {
        OnCalendar = config.myOptions.autoClean.frequency;
        Persistent = true;
        Unit = "trash-empty.service";
      };
      wantedBy = [ "timers.target" ];
    };
  };
}
