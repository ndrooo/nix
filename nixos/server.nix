{ pkgs, ... }: {
  imports = [];

  virtualisation.docker.enable = true;
  users.users.ndrooo.extraGroups = [ "docker" ];
  virtualisation.oci-containers.containers.homarr = {
    image = "ghcr.io/ajnart/homarr:latest";
    volumes = [
      "./homarr/configs:/app/data/configs"
      "./homarr/icons:/app/public/icons"
      "./homarr/data:/data"
    ];
    ports = ["7575:7575"];
  };
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
