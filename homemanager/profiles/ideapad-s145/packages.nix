{ pkgs, ... }: {
  home.packages = with pkgs; [
    # gui
    helix
    obsidian
    vscodium

    # tui/cli
    apx
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

