{ pkgs, ... }: {
  imports = [];

  virtualisation.oci-containers = {
    backend = "podman";
    containers.omada = {
      image = "mbentley/omada-controller";
      environment = {
        TZ = "America/New_York";
      };
      extraOptions = [
        "--network=host"
        "--ulimit nofile=4096:8192"
        "--stop-timeout 60"
        "--restart unless-stopped"
      ];
      volumes = [
        "omada-data:/opt/tplink/EAPController/data"
        "omada-logs:/opt/tplink/EAPController/logs"
      ];
    };
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
  networking = {
    firewall.allowedTCPPorts = [ 8123 ]; # for home-assistant
    firewall.checkReversePath = "loose";
  };
  services.plex = {
    enable = true;
    openFirewall = true;
  };
  services.octoprint = {
    enable = true;
    openFirewall = true;
    plugins = plugins: with plugins; [ ender3v2tempfix printtimegenius themeify ];
  };
}
