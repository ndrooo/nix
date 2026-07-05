{ ... }: 
let
  modules = import ./modules;
in {
  imports = [
    ./base.nix
    modules.cli
  ];

  services.syncthing = {
    enable = true;
    guiAddress = "0.0.0.0:8384";
  };
}
