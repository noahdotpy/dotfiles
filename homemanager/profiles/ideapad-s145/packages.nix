{ pkgs, ... }: {
  home.packages = with pkgs; [
    vscode
    helix

    delta
    gh
    lazygit
    just
    ripgrep

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

