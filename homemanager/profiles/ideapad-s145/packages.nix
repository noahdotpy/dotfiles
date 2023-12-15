{ pkgs, ... }: {
  home.packages = with pkgs; [
    # gui
    helix
    obsidian
    vscodium

    # tui/cli
    calc
    delta
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
  ];
}

