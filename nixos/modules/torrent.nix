{ pkgs, ... }: {
  imports = [];

  virtualisation.oci-containers = {
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
  networking.firewall = {
    checkReversePath = "loose";
  };
}
