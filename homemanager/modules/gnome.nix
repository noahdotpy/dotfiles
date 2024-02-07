{ pkgs
, lib
, config
, ...
}:
with lib; let
  cfg = config.modules.gnome;
in
{
  options.modules.gnome.enable = mkEnableOption "gnome";

  config = mkMerge [
    (mkIf cfg.enable {
      xsession.enable = true;
      home.packages = mkMerge [
        (with pkgs.gnomeExtensions; [
          alphabetical-app-grid
          battery-health-charging
          blur-my-shell
          caffeine
          compiz-windows-effect
          fuzzy-app-search
          gsconnect
          hot-edge
          just-perfection
          lock-keys
          pano
          pop-shell
          smile-complementary-extension
          user-themes
        ])
        (with pkgs; [
          adw-gtk3
          cinnamon.mint-y-icons
        ])
      ];
    })
  ];
}
