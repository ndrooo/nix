{ pkgs, ... }: {
  imports = [];

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
