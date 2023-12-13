{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.fonts;
in {
  options.modules.fonts.enable = mkEnableOption "enable a set of fonts";

  config = mkMerge [
    (mkIf cfg.enable {
      fonts.fontconfig.enable = true;
      home.packages = with pkgs; [
        (nerdfonts.override {fonts = ["Iosevka" "SourceCodePro"];})
      ];
    })
  ];
}
