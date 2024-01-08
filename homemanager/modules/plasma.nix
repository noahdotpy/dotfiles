{ pkgs
, lib
, config
, ...
}:
with lib; let
  cfg = config.modules.plasma;
in
{
  options.modules.plasma.enable = mkEnableOption "plasma";

  config = mkMerge [
    (mkIf cfg.enable {
      home.packages = with pkgs; [
        arc-kde-theme
        arc-theme
        papirus-icon-theme
      adw-gtk3
      ];
    })
  ];
}
