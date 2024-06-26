# dnscrypt.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions.dnscrypt;
in {
  options.myOptions = {
    hasIpv6Internet = mkOption {
      type = types.bool;
      default = false;
    };
    dnscrypt = {
      blocklist = mkOption {
        type = types.lines;
        default = '''';
      };
      stateDirectory = mkOption {
        type = types.singleLineStr;
        default = "dnscrypt-proxy";
      };
      dir = mkOption {
        type = types.singleLineStr;
        readOnly = true;
        default = "/var/lib/${cfg.stateDirectory}";
      };
    };
  };

  config = {
    myOptions.dnscrypt.blocklist = mkIf config.services.dnscrypt-proxy2.enable ''
      ${builtins.readFile "${cfg.dir}/oisd_big_domainswild.txt"}
    '';

    # See https://nixos.wiki/wiki/Encrypted_DNS
    services.dnscrypt-proxy2 = {
      enable = mkDefault true;
      # See https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
      settings = {
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.network.info/resolvers-list/v3/public-resolvers.md"
          ];
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3"; # See https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
          cache_file = "${cfg.dir}/public-resolvers.md";
        };

        # Use servers reachable over IPv6 -- Do not enable if you don't have IPv6 connectivity
        ipv6_servers = config.myOptions.network.hasIpv6Internet && config.networking.enableIPv6;
        block_ipv6 = !(config.myOptions.network.hasIpv6Internet && config.networking.enableIPv6);

        require_dnssec = true;
        require_nolog = false;
        require_nofilter = true;

        blocked_names.blocked_names_file = pkgs.writeText "blocklist.txt" cfg.blocklist;
      };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory =
      mkIf (config.services.dnscrypt-proxy2.enable)
      cfg.stateDirectory;
  };
}
