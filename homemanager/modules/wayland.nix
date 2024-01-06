{ pkgs
, lib
, config
, ...
}:
with lib; let
  cfg = config.modules.wayland;
in
{
  options.modules.wayland.enable = mkEnableOption "wayland";

  config = mkMerge [
    (mkIf cfg.enable {
      home.packages = with pkgs; [
        wl-clipboard
      ];
    })
  ];
}
