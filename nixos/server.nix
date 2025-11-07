{ pkgs, ... }: {
  imports = [];

  virtualisation.oci-containers = {
    backend = "podman";
    containers.omada = {
      image = "mbentley/omada-controller:6";
      autoStart = true;
      environment = {
        PUID = "508";
        PGID = "508";
        MANAGE_HTTP_PORT = "8088";
        MANAGE_HTTPS_PORT = "8043";
        PORTAL_HTTP_PORT = "8088";
        PORTAL_HTTPS_PORT = "8843";
        PORT_APP_DISCOVERY = "27001";
        PORT_DISCOVERY = "29810";
        PORT_MANAGER_V1 = "29811";
        PORT_ADOPT_V1 = "29812";
        PORT_UPGRADE_V1 = "29813";
        PORT_MANAGER_V2 = "29814";
        PORT_TRANSFER_V2 = "29815";
        PORT_RTTY = "29816";
        PORT_DEVICE_MONITOR = "29817";
        SHOW_SERVER_LOGS = "true";
        SHOW_MONGODB_LOGS = "false";
        SSL_CERT_NAME = "tls.crt";
        SSL_KEY_NAME = "tls.key";
        TZ = "America/New_York";
      };
      extraOptions = [
        "--network=host"
        "--ulimit=nofile=4096:8192"
        "--stop-timeout=60"
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
  networking.firewall = {
    allowedTCPPorts = [
      8123   # for home-assistant
      8088   # MANAGE_HTTP_PORT / PORTAL_HTTP_PORT
      8043   # MANAGE_HTTPS_PORT
      8843   # PORTAL_HTTPS_PORT
      27001  # PORT_APP_DISCOVERY
      29810  # PORT_DISCOVERY
      29811  # PORT_MANAGER_V1
      29812  # PORT_ADOPT_V1
      29813  # PORT_UPGRADE_V1
      29814  # PORT_MANAGER_V2
      29815  # PORT_TRANSFER_V2
      29816  # PORT_RTTY
      29817  # PORT_DEVICE_MONITOR
    ];
    allowedUDPPorts = [
      27001  # PORT_APP_DISCOVERY
      29810  # PORT_DISCOVERY
    ];
    checkReversePath = "loose";
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

  users.users.omada = {
    uid = 508;
    isSystemUser = true;
    group = "omada";
    description = "Omada Controller user";
  };

  users.groups.omada = {
    gid = 508;
  };
}
