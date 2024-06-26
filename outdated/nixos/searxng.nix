# searxng.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions.searxng.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf (config.myOptions.searxng.enable) {
    services.searx = {
      enable = true;
      redisCreateLocally = lib.mkDefault true;
      settings.server = {
        # port = lib.mkDefault ;
        bind_address = lib.mkDefault "::1";
        secret_key = lib.mkDefault "Do NOT expose this server to the Internet.";
      };
    };
  };
}
