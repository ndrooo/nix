{ pkgs, ... }: {
  imports = [];

  services.plex = {
    enable = true;
    openFirewall = true;
  };
}