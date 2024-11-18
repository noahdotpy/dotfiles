{ pkgs
, lib
, config
, ...
}:
with lib; let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland.enable = mkEnableOption "hyprland";

  config = mkMerge [
    (mkIf cfg.enable {
      home.packages = with pkgs; [
        grimblast
        hyprpanel
        nwg-look
      ];
    })
  ];
}
