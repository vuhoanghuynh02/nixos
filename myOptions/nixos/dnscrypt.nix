# dnscrypt.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.myOptions = {
    hasIpv6Internet = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    dnscrypt = {
      blocklist = lib.mkOption {
        type = lib.types.lines;
        default = '''';
      };
      stateDirectory = lib.mkOption {
        type = lib.types.singleLineStr;
        default = "dnscrypt-proxy";
      };
    };
  };

  config = let
    cfg = config.myOptions.dnscrypt;
  in {
    assertions = [
      {
        assertion =
          !(cfg.blocklist != '''')
          || config.services.dnscrypt-proxy2.enable;
      }
    ];

    myOptions.dnscrypt.blocklist = lib.mkIf config.services.dnscrypt-proxy2.enable ''
      ${builtins.readFile ../../.tmp/oisd_big.txt}
    '';

    # See https://nixos.wiki/wiki/Encrypted_DNS
    services.dnscrypt-proxy2 = {
      enable = lib.mkDefault true;
      # See https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
      settings = {
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.network.info/resolvers-list/v3/public-resolvers.md"
          ];
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3"; # See https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
          cache_file = "/var/lib/${cfg.stateDirectory}/public-resolvers.md";
        };

        # Use servers reachable over IPv6 -- Do not enable if you don't have IPv6 connectivity
        ipv6_servers = config.myOptions.network.hasIpv6Internet && config.networking.enableIPv6;
        block_ipv6 = !(config.myOptions.network.hasIpv6Internet && config.networking.enableIPv6);

        require_dnssec = true;
        require_nolog = false;
        require_nofilter = true;

        # If you want, choose a specific set of servers that come from your sources.
        # Here it's from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
        # If you don't specify any, dnscrypt-proxy will automatically rank servers
        # that match your criteria and choose the best one.
        # server_names = [ ... ];

        blocked_names.blocked_names_file = pkgs.writeText "blocklist.txt" cfg.blocklist;
      };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory =
      lib.mkIf (config.services.dnscrypt-proxy2.enable)
      cfg.stateDirectory;
  };
}
