{
  nixConfig.extra-substituters = [ "https://numtide.cachix.org" ];
  nixConfig.extra-trusted-public-keys = [ "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE=" ];

  description = "My homemanager configuration currently deployed on OpenSuse Tumbleweed";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    homemanager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devshell.url = "github:numtide/devshell";

    parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { self, ... }:
    inputs.parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { config, inputs', pkgs, system, ... }:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          _module.args.pkgs = pkgs;

          devShells = {
            default = inputs'.devshell.legacyPackages.mkShell {
              packages = with pkgs; [
		chezmoi
                alejandra
                git
                home-manager
                nix
              ];
              commands =
                let
                  path = "$HOME/.local/share/chezmoi";
                  find = "${pkgs.findutils}/bin/find";
                  entr = "${pkgs.entr}/bin/entr";

                  findAllFilesExpr = "${path}/{chezmoi,homemanager,flake.nix}";
                  findNixFilesExpr = "${path}/{homemanager,flake.nix}";
                  findChezmoiFilesExpr = "${path}/chezmoi";

                  findAllFiles = "${find} ${findAllFilesExpr}";
                  findNixFiles = "${find} ${findNixFilesExpr}";
                  findChezmoiFiles = "${find} ${findChezmoiFilesExpr}";

                  applyAll = "$HOME/.local/bin/apply.sh";
                  applyHomeManager = "home-manager switch --flake ${path}";
                  applyChezmoi = "${pkgs.chezmoi}/bin/chezmoi apply";

                  watchAll = "${findAllFiles} | ${entr} ${applyAll}";
                  watchHomeManager = "${findNixFiles} | ${entr} ${applyHomeManager}";
                  watchChezmoi = "${findChezmoiFiles} | ${entr} ${applyChezmoi}";
                in
                [
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

          formatter = pkgs.alejandra;
        };
      flake = {
        homeConfigurations."noah@ideapad-s145" =
          inputs.homemanager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            modules = [
              {
                _module.args = {
                  inherit inputs;
                  inherit self;
                };
              }
              ./homemanager/profiles/ideapad-s145
              ./homemanager
            ];
          };
      };
    };
}

