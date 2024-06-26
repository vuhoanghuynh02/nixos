# redroid.nix

{
  config,
  lib,
  pkgs,
  ...
}:
let
  prePort = "557";
  containerName = "redroid_\${ANDROID_VERSION}";
  redroidDevice = "localhost:$PORT";
in
{
  config = lib.mkIf (config.myOptions.redroid.enable) {
    home.packages = with pkgs; [
      android-tools
      scrcpy

      (pkgs.writeShellScriptBin "redroid-run" ''
        ANDROID_VERSION=$1
        PORT="${prePort}''${ANDROID_VERSION}"
        DATA_PATH="${config.myOptions.homeDirectory}/${containerName}_data"
        mkdir -p $DATA_PATH

        sudo ${pkgs.podman}/bin/podman run -itd --rm --privileged \
          --pull always \
          -v $DATA_PATH:/data \
          -p $PORT:5555 \
          --name ${containerName} \
          docker.io/redroid/redroid:''${ANDROID_VERSION}.0.0-latest \
          androidboot.use_memfd=true \
          androidboot.redroid_gpu_mode=host \
          androidboot.redroid_width=1920 \
          androidboot.redroid_height=1040 \
          androidboot.redroid_dpi=256 \
          androidboot.redroid_fps=7 \
          #
        sleep 2
        ${pkgs.android-tools}/bin/adb connect ${redroidDevice}
        sleep 4
        ${pkgs.scrcpy}/bin/scrcpy -s ${redroidDevice} --audio-codec=aac
      '')

      (pkgs.writeShellScriptBin "redroid-stop" ''
        ANDROID_VERSION=$1
        PORT="${prePort}''${ANDROID_VERSION}"

        sudo ${pkgs.podman}/bin/podman stop ${containerName}
        ${pkgs.android-tools}/bin/adb disconnect ${redroidDevice}
      '')
    ];
  };
}
