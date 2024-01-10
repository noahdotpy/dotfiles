{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixgl.nixGLIntel

    # gui
    chromium

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
