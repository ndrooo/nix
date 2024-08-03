{ pkgs, ... }: {
  imports = [];

  virtualisation.oci-containers = {
    backend = "podman";
    containers.homarr = {
      image = "ghcr.io/ajnart/homarr:latest";
      ports = ["7575:7575"];
    };
    containers.homeassistant = {
      volumes = [ "home-assistant:/config" ];
      environment.TZ = "America/New_York";
      image = "ghcr.io/home-assistant/home-assistant:stable"; # Warning: if the tag does not change, the image will not be updated
      extraOptions = [ 
        "--network=host" 
      ];
    };
  };
  networking.firewall.allowedTCPPorts = [ 8123 ]; # for home-assistant
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  services.plex = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
  services.octoprint = {
    enable = true;
    openFirewall = true;
    plugins = plugins: with plugins; [ ender3v2tempfix printtimegenius themeify ];
  };
}
