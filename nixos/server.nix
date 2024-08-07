{ pkgs, ... }: {
  imports = [];

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.0.0.2/24" "fdc9:281f:04d7:9ee9::2/64" ];
      dns = [ "10.0.0.1" "fdc9:281f:04d7:9ee9::1" ];
      privateKeyFile = "/root/wireguard-keys/privatekey";
      
      peers = [
        {
          publicKey = "KwU9qcRO0eamCxh/iF7pL2RAOOJezHPVqkIeANcS5Wk=";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "154.47.25.129:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };

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
