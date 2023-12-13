{ inputs
, config
, pkgs
, ...
}: {
  imports = [ ./packages.nix ./nix-config.nix ];

  modules.fonts.enable = true;
  # modules.neovim.enable = true;
  modules.zsh.enable = true;
}
