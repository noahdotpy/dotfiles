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
      gtk.theme = {
        name = "Adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      home.packages = mkMerge [
        (with pkgs.gnomeExtensions; [
          alphabetical-app-grid
          arcmenu
          blur-my-shell
          just-perfection
        ])
      ];
    })
  ];
}
