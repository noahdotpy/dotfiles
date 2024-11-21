{
  inputs',
  inputs,
  pkgs,
  ...
}: {
  devShells = {
    default = inputs'.devshell.legacyPackages.mkShell {
      packages = [
        pkgs.alejandra
        pkgs.chezmoi
        pkgs.git
        pkgs.nix
        pkgs.home-manager
        pkgs.system-manager
        inputs'.system-manager
      ];
      commands = let
        path = "$HOME/.local/share/chezmoi";

        apply = "$HOME/.local/bin/apply.sh";
        watch = "
            ${pkgs.findutils}/bin/find ${path}/{chezmoi,homemanager,flake.nix} |
            ${pkgs.entr}/bin/entr ${apply}
           ";
      in [
        {
          name = "watch";
          command = "${watch}";
          help = "automatically apply when changes are detected";
        }
        {
          name = "apply";
          command = "${apply}";
          help = "apply changes from chezmoi and homemanager/";
        }
        {
          name = "update";
          command = "nix flake update ${path}";
          help = "update nix inputs";
        }
      ];
      name = "dots";
    };
  };
}
