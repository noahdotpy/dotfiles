{
  description = "My home-manager and system-manager configuration currently deployed on my custom Fedora Atomic image at https://github.com/noahdotpy/myublue";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixgl.url = "github:guibou/nixGL";

    # TODO: Update ref to correct tag for the hyprland version I'm on
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland/tree/v0.45.2?submodules=1";
    hyprland.url = "github:hyprwm/Hyprland/v0.45.2";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins/v0.45.0";
      inputs.hyprland.follows = "hyprland";
    };

    hy3 = {
      # TODO: Update ref to correct tag for the hyprland version I'm on
      # https://github.com/outfoxxed/hy3/tree/hl0.45.0
      url = "github:outfoxxed/hy3/hl0.45.0"; # where {version} is the hyprland release version
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devshell.url = "github:numtide/devshell";
    parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {self, ...}:
    inputs.parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      perSystem = {
        config,
        inputs',
        pkgs,
        system,
        ...
      }: let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in {
        _module.args.pkgs = pkgs;

        imports = [./devshell.nix];
        formatter = pkgs.alejandra;
      };

      flake = {
        homeConfigurations."noah@ideapad-s145" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import inputs.nixpkgs {
            system = "x86_64-linux";
            overlays = [
              inputs.nixgl.overlay
            ];
          };
          modules = [
            {
              _module.args = {
                inherit inputs;
                inherit self;
              };
            }
            inputs.hyprland.homeManagerModules.default
            ./nix/home-manager/profiles/ideapad-s145
            ./nix/home-manager
          ];
        };

        systemConfigs.default = inputs.system-manager.lib.makeSystemConfig {
          modules = [
            ./nix/system-manager
          ];
        };
      };
    };
}
