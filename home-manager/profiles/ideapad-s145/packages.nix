{ inputs
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    # Comments surrounded by `:` are the start of a new section

    # nixgl.nixGLIntel

    # :tui/cli:
    helix
    sd
    superfile
    yazi

    # :dev:
    go

    # :unorganised:
  ];
}
