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
      modules.wayland.enable = true;
      home.packages = with pkgs; [
        grimblast
        nwg-look
      ];
    })
  ];
}
