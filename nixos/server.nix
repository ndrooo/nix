{ pkgs, ... }: {
  imports = [];

  virtualisation.oci-containers = {
    backend = "podman";
    containers.gluetun = {
      image = "qmcgaw/gluetun";
      ports = [
        "6081:6881"
        "6081:6881/udp"
        "6011:6011"
      ];
      volumes = [
        "/root/gluetun:/gluetun"
      ];
      environment = {
        VPN_SERVICE_PROVIDER = "protonvpn";
        VPN_TYPE = "wireguard";
        SERVER_COUNTRIES="United States";
        PORT_FORWARD_ONLY="on";
        VPN_PORT_FORWARDING="on";
      };
      environmentFiles = [/root/wireguard-keys/wg.env];
      extraOptions = ["--cap-add=NET_ADMIN" "--device=/dev/net/tun"];
    };
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
    containers.qbittorrent = {
      image = "ghcr.io/linuxserver/qbittorrent";
      environment = {
        PUID = "1000";
        PGID = "100";
        TZ = "America/New_York";
        WEBUI_PORT = "6011";
      };
      dependsOn = [ "gluetun" ];
      volumes = [
        "/twistor:/twistor"
        "/root/qbittorrent/config:/config"
      ];
      extraOptions = ["--network=container:gluetun"];
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
