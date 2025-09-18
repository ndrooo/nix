{ pkgs, nixpkgs, pkgs-stable, ... }: {
  home.packages = [
    pkgs.gimp
    pkgs.xfce.thunar
    pkgs.digikam
    pkgs-stable.darktable
    pkgs.godot_4
    pkgs.protonvpn-gui
    pkgs._1password-gui
    pkgs.signal-desktop
    pkgs.discord
    pkgs.slack
    pkgs.zoom-us
    pkgs.prusa-slicer
    pkgs.itch
    pkgs.blender
    pkgs.obsidian
    pkgs.butler
    pkgs.yt-dlp
    pkgs.lutris
    pkgs.cemu
    pkgs.todoist-electron
    pkgs.zed-editor
    pkgs.aseprite
    pkgs.vlc
  ];

  nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0"];
}
