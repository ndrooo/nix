{ pkgs, pkgs-stable, ... }: {
  home.packages = [
    pkgs.gimp
    pkgs.thunar
    pkgs-stable.darktable
    pkgs.godot
    pkgs.protonvpn-gui
    pkgs._1password-gui
    pkgs.signal-desktop
    pkgs.discord
    pkgs.slack
    pkgs.zoom-us
    pkgs.prusa-slicer
    pkgs.itch
    pkgs.blender
    pkgs.inkscape
    pkgs.obsidian
    pkgs.butler
    pkgs.yt-dlp
    pkgs.todoist-electron
    pkgs.aseprite
    pkgs.vlc
    pkgs.easyrpg-player
  ];

  nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0"];
}
