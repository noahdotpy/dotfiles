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
                alejandra
                git
                nix
                home-manager
              ];
              commands = [
                {
                  name = "watch";
                  command = "${pkgs.findutils}/bin/find $HOME/.local/share/chezmoi/dots/ | ${pkgs.entr}/bin/entr chezmoi apply; home-manager switch --flake $HOME/.local/share/chezmoi";
                }
                {
                  name = "apply";
                  command = "chezmoi apply; home-manager switch --flake $HOME/.local/share/chezmoi";
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
