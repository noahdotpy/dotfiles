{ inputs
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    # Comments surrounded by `:` are the start of a new section

    # nixgl.nixGLIntel

    # :tui/cli:
    # sd

    # :dev:
    # cargo
    # cargo-modules
    # cargo-watch
    # go
    # rustfmt

    # :unorganised:
  ];
}
