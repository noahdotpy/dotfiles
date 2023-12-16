{ inputs
, config
, pkgs
, ...
}: {
  imports = [ ./packages.nix ./nix-config.nix ];

  modules = {
    fonts.enable = true;
    gnome.enable = true;
    hyprland.enable = true;
    neovim.enable = true;
    zsh.enable = true;
  };
}
