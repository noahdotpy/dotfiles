{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

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
  };

  outputs = inputs @ { self, ... }:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."noah@ideapad-s145" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
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
