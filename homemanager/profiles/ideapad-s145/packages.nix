{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixgl.nixGLIntel

    # gui
    brave

    # tui/cli
    apx
    btop
    calc
    chezmoi
    delta
    entr
    fzf
    gh
    just
    lazygit
    lf
    lsd
    ripgrep
    sd

    # dev
    cargo
    cargo-modules
    cargo-watch
    gcc
    go
    rustfmt
    vscodium
  ];
}

