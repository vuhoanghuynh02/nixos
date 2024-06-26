# base_security.nix

{ lib, ... }:
{
  networking.firewall.enable = true;

  # No temporary information go to storage
  boot.tmp.useTmpfs = true;
  zramSwap.writebackDevice = lib.mkForce null;
  swapDevices = lib.mkForce [ ];

  # https://nixos.wiki/wiki/Encrypted_DNS
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [
        "cloudflare-family" # not open-source
        # https://alternativeto.net/feature/dns-server/?license=opensource&platform=self-hosted
        "dnsforge.de"
        "adguard-dns-family-doh"
        "ahadns-doh-nl"
        "ahadns-doh-la"
      ];
    };
  };
  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };
}
