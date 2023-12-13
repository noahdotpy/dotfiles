{ pkgs, ... }: {
  home.packages = with pkgs; [
    vscodium
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

