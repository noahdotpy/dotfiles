{ pkgs, ... }: {
  home.packages = with pkgs; [
    vscode
    helix
    neovim

    delta
    gh
    lazygit

    cargo
    cargo-modules
    cargo-watch
    gcc
    go
    rustfmt

    calc
    lsd
    pfetch
  ];
}
