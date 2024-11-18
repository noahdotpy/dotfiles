{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixgl.nixGLIntel

    # tui/cli
    duf
    lf
    lsd
    ncdu
    sd
    delta

    # dev
    cargo
    cargo-modules
    cargo-watch
    gcc
    go
    meson
    ninja
    rustfmt
  ];
}
