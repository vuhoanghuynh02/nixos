# killers.nix
{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myOptions.killers;
in {
  options.myOptions.killers = {
    nsfw.disable = mkOption {
      type = types.bool;
      default = true;
    };
    game.disable = mkOption {
      type = types.bool;
      default = true;
    };
    anime.disable = mkOption {
      type = types.bool;
      default = true;
    };
    manga.disable = mkOption {
      type = types.bool;
      default = true;
    };
    recommenderSystem.disable = mkOption {
      type = types.bool;
      default = false;
    };
    instantMessage.disable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    myOptions.dnscrypt.blocklist = ''
      ${
        if (cfg.instantMessage.disable)
        then ''
          chat.zalo.me
          messenger.com
          facebook.com
          app.element.io
          chat.tchncs.de
        ''
        else ''''
      }
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
        if (cfg.recommenderSystem.disable)
        then ''
          youtube.com
          tiktok.com
        ''
        else ''''
      }
      ${
        if (cfg.nsfw.disable)
        then builtins.readFile "${config.myOptions.dnscrypt.dir}/oisd_nsfw_domainswild.txt"
        else ''''
      }
    '';
  };
}
