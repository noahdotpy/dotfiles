{ pkgs
, lib
, config
, inputs
, ...
}:
with lib; let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland.enable = mkEnableOption "enable configuration for hyprland";

  config = mkMerge [
    (mkIf cfg.enable {
      wayland.windowManager.hyprland = {
        enable = true;
        plugins = [
          inputs.hy3.packages.x86_64-linux.hy3
          inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
          inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
        ];
        extraConfig = ''
          source=~/.config/hypr/init.conf
        '';
      };
    })
  ];
}
