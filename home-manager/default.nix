{ self
, config
, pkgs
, inputs
, ...
}: {
  imports = [ ./modules ];

  news.display = "silent";

  home = rec {
    username = "noah";
    homeDirectory = "/home/${username}";

    enableNixpkgsReleaseCheck = true;

    # DON'T CHANGE
    stateVersion = "22.05";
  };

  programs.home-manager.enable = true;
}
