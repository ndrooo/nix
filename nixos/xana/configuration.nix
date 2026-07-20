{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../base.nix
    ../modules/omada.nix
    ../modules/plex.nix
    ../modules/torrent.nix
    ../modules/home-assistant.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems = {
    "/" = {
      options = [ "noatime" ];
    };
  };

  environment.etc.fstab = {
    enable = true;
    text = ''
      UUID=52030d99-d654-4516-aea4-ba33d174882c /twistor ext4 rw,relatime,nofail 0 2
    '';
  };

  age.identityPaths = [ "/root/.ssh/id_ed25519" ];
  age.secrets.ddclient.file = ../../secrets/ddclient.age;

  services.ddclient = {
    enable = true;
    configFile = config.age.secrets.ddclient.path;
  };

  networking = {
    hostName = "xana";
    networkmanager = {
      enable = true;
    };
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."qb" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:6011";
      };
    };
    virtualHosts."qb.xana.local" = {
      locations."/" = {
        proxyPass = "http://localhost:6011";
      };
    };
    virtualHosts."omada" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:8043";
      };
    };
    virtualHosts."omada.xana.local" = {
      locations."/" = {
        proxyPass = "http://localhost:8043";
      };
    };
    virtualHosts."sync.xana.local" = {
      locations."/" = {
        proxyPass = "http://localhost:8384";
      };
    };
    virtualHosts."home.xana.local" = {
      locations."/" = {
        proxyPass = "http://localhost:8123";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [
    80
    443
    8384
  ];

  users.users.ndrooo.linger = true;

  hardware.enableRedistributableFirmware = true;
}
