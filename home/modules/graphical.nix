{ pkgs, ... }:
{
  home.packages = with pkgs; [
    _1password-gui
    obsidian
    todoist-electron
    # media
    yt-dlp
    tidal-hifi
    zathura
    easyrpg-player
    # communications
    signal-desktop
    discord
    slack
    zulip
    zoom-us
    # cad, art, making
    orca-slicer
    gimp
    openscad
    inkscape
    rapidraw
    # game development
    godot
    aseprite
    butler
    itch
    blender
  ];

  programs.zed-editor.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "image/png" = "feh.desktop";
      "image/jpeg" = "feh.desktop";
      "application/pdf" = "zen.desktop";
      "x-scheme-handler/sgnl" = "signal.desktop";
      "x-scheme-handler/signalcaptcha" = "signal.desktop";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
}
