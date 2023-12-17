{ pkgs, ... }: {
  home.packages = with pkgs; [
    # gui
    helix
    obsidian
    vscodium

    # tui/cli
    apx
    btop
    calc
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

    # bible
    xiphos
  ];
}

