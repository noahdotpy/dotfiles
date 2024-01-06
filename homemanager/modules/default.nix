# Always add to this file when adding new module
{ inputs
, pkgs
, config
, ...
}: {
  imports = [
    ./fonts.nix
    ./gnome.nix
    ./hyprland.nix
    ./neovim.nix
    ./plasma.nix
    ./zsh.nix
  ];
}
