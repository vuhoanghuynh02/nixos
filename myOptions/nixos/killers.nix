# killers.nix
{
  config,
  lib,
  ...
}: {
  options.myOptions.killers = {
    nsfw.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    game.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    anime.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    manga.disable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    recommenderSystem.disable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    instantMessage.disable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = let
    cfg = config.myOptions.killers;
  in {
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
        then builtins.readFile ../../.tmp/oisd_nsfw.txt
        else ''''
      }
    '';
  };
}
