{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixgl.nixGLIntel

    # gui
    chromium

    # tui/cli
    apx
    bat
    btop
    calc
    chezmoi
    duf
    entr
    fd
    fzf
    htop
    just
    lazygit
    lf
    lsd
    ncdu
    pfetch-rs
    ripgrep
    sd
    topgrade

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

    # dependencies
    gum
  ];
}
