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

    parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ { self, ... }:
    inputs.parts.lib.mkFlake { inherit inputs; } {
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
          ./home-manager/profiles/ideapad-s145
          ./home-manager
        ];
      };
    };
}
