{
  pkgs,
  lib,
  config,
  myPkgs,
  ...
}:
with lib; let
  cfg = config.modules.zsh;
in {
  options.modules.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      lolcat
      cowsay
      kjv
    ];
    programs = {
      direnv.enable = true;
      pazi.enable = true;
      starship.enable = true;
    };
  };
}
