{ pkgs, ... }: {
  services.flameshot.enable = true;
  services.flameshot.package = (pkgs.flameshot.override { enableWlrSupport = true; });
  services.flameshot.settings = {
    General = {
      disabledTrayIcon = true;
      showStartupLaunchMessage = false;
    };
  };
}