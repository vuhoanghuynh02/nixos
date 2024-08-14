# dnscrypt-proxy.nix

{ config, lib, pkgs, ... }:
{
  # See https://nixos.wiki/wiki/Encrypted_DNS
  services.dnscrypt-proxy2 = {
    enable = true;
    # See https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
    settings = {
      ipv6_servers = config.networking.enableIPv6;
      block_ipv6 = ! (config.networking.enableIPv6);
      require_dnssec = true; # security
      require_nolog = false;

      require_nofilter = false;
      sources.parental-control = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/parental-control.md"
          "https://download.dnscrypt.info/resolvers-list/v3/parental-control.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy/parental-control.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
      cloaking_rules = pkgs.writeText "cloaking_rules.txt" ''
        www.youtube.com restrictmoderate.youtube.com
        m.youtube.com restrictmoderate.youtube.com
      '';
    };
  };
}
