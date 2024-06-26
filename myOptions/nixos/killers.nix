# killers.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions.killers = {
    tiktok.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    youtube.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    game.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    manga.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    anime.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    nsfw.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    youtube.restrictmoderate = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = let
    cfg = config.myOptions.killers;
  in {
    myOptions.dnscrypt.blocklist = ''
      ${
        if (cfg.manga.disable)
        then ''mangadex.org''
        else ''''
      }
      ${
        if (cfg.anime.disable)
        then ''
          animekai.*
          miruro.*
        ''
        else ''''
      }
      ${
        if (cfg.anime.disable || cfg.manga.disable)
        then ''myanimelist.net''
        else ''''
      }
      ${
        if (cfg.game.disable)
        then ''
          store.steampowered.com
          protondb.com
          lutris.net
          papergames.io
        ''
        else ''''
      }
      ${
        if (cfg.youtube.disable)
        then ''
          youtube.com
          inv.nadeko.net
          invidious.nerdvpn.de
          id.420129.xyz
          yewtu.be
        ''
        else ''''
      }
      ${
        if (cfg.tiktok.disable)
        then ''tiktok.com''
        else ''''
      }
      ${builtins.readFile ../../.tmp/oisd_nsfw.txt}
    '';

    myOptions.dnscrypt.cloakingRules = lib.mkIf (cfg.youtube.restrictmoderate) ''
      www.youtube.com restrictmoderate.youtube.com
      m.youtube.com restrictmoderate.youtube.com
      youtubei.googleapis.com restrictmoderate.youtube.com
      youtube.googleapis.com restrictmoderate.youtube.com
      www.youtube-nocookie.com restrictmoderate.youtube.com
    '';
  };
}
