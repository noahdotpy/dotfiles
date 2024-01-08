{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [./packages.nix ./nix-config.nix];

  modules = {
    fonts.enable = true;
    neovim.enable = true;
    plasma.enable = true;
    wayland.enable = true;
    zsh.enable = true;
  };
}
