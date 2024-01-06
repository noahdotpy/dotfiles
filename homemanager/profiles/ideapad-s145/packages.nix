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
    entr
    fzf
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
    delta
    gcc
    gh
    go
    meson
    ninja
    rustfmt
    vscode
  ];
}

