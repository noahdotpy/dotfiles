# Always add to this file when adding new module
{ inputs
, pkgs
, config
, ...
}: {
  imports = [
    ./fonts.nix
    ./gnome.nix
    ./neovim.nix
    ./zsh.nix
    ./hyprland.nix
  ];
}
