# element-web.nix

{ config, lib, pkgs, ... }:
let
  web-dir = pkgs.element-web.override {
    # See https://github.com/element-hq/element-web/blob/develop/config.sample.json
    conf = {
      default_server_config."m.homeserver" = rec {
        base_url = "http://${server_name}";
        server_name = "localhost:6167";
      };
      disable_guests = true;
      disable_3pid_login = true;
      default_country_code = "VN";
      show_labs_settings = true;
      default_theme = "dark";
    };
  };
  element-web-server = pkgs.writeShellScriptBin "element-web-server" ''
    ${pkgs.python3}/bin/python3 -m http.server 9250 -b ::1 -d ${web-dir}
  '';
in
{
  home.packages = [ element-web-server ];
}
