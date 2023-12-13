{ self
, config
, pkgs
, inputs
, ...
}: {
  imports = [ ./modules ];

  home = rec {
    username = "noah";
    homeDirectory = "/home/${username}";

    enableNixpkgsReleaseCheck = true;
    stateVersion = "22.05";
  };

  xdg.dataFile."hm-generation".source = self;

  programs.home-manager.enable = true;
}
