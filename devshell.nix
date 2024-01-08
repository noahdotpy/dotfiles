{inputs', inputs, pkgs, ...}: {
  devShells = {
    default = inputs'.devshell.legacyPackages.mkShell {
      packages = with pkgs; [
        alejandra
        chezmoi
        git
        home-manager
        nix
      ];
      commands = let
        path = "$HOME/.local/share/chezmoi";
        find = "${pkgs.findutils}/bin/find";
        entr = "${pkgs.entr}/bin/entr";

        findAllFiles = "${find} ${path}/{chezmoi,homemanager,flake.nix}";
        findNixFiles = "${find} ${path}/{homemanager,flake.nix}";
        findChezmoiFiles = "${find} ${path}/chezmoi";

        applyAll = "$HOME/.local/bin/apply.sh";
        applyHomeManager = "home-manager switch --flake ${path}";
        applyChezmoi = "${pkgs.chezmoi}/bin/chezmoi apply";

        watchAll = "${findAllFiles} | ${entr} ${applyAll}";
        watchHomeManager = "${findNixFiles} | ${entr} ${applyHomeManager}";
        watchChezmoi = "${findChezmoiFiles} | ${entr} ${applyChezmoi}";
      in [
        {
          name = "watch";
          command = "${watchAll}";
          help = "watch chezmoi+homemanager";
        }
        {
          name = "watch-homemanager";
          command = "${watchHomeManager}";
          help = "watch homemanger";
        }
        {
          name = "watch-chezmoi";
          command = "${watchChezmoi}";
          help = "watch chezmoi";
        }
        {
          name = "apply";
          command = "${applyAll}";
          help = "apply chezmoi+homemanager";
        }
        {
          name = "apply-homemanager";
          command = "${applyHomeManager}";
          help = "apply homemanager";
        }
        {
          name = "apply-chezmoi";
          command = "${applyChezmoi}";
          help = "apply chezmoi";
        }
      ];
      name = "dots";
    };
  };
}
