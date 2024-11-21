{
  self,
  config,
  pkgs,
  inputs,
  ...
}: {
  config = {
    system-manager.allowAnyDistro = true;

    nixpkgs.hostPlatform = "x86_64-linux";

    environment = {
      etc = {
        "foo.conf".text = ''
          launch_the_rockets = true
        '';
      };

      systemPackages = [
        pkgs.ripgrep
        pkgs.fd
        pkgs.hello
      ];
    };
  };
}
