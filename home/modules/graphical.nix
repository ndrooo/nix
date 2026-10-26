{ pkgs, ... }:
{
  home.packages = with pkgs; [
    proton-pass
    obsidian
    todoist-electron
    # media
    yt-dlp
    tidal-hifi
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
      "text/html" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "image/png" = "feh.desktop";
      "image/jpeg" = "feh.desktop";
      "application/pdf" = "zen-beta.desktop";
      "x-scheme-handler/sgnl" = "signal.desktop";
      "x-scheme-handler/signalcaptcha" = "signal.desktop";
    };
  };

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
}
