{ inputs'
, inputs
, pkgs
, ...
}: {
  devShells = {
    default = inputs'.devshell.legacyPackages.mkShell {
      packages = [
        pkgs.alejandra
        pkgs.chezmoi
        pkgs.git
        pkgs.home-manager
        pkgs.nix
      ];
      name = "myhome";
    };
  };
}
