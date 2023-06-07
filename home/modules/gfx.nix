{ pkgs, ... }: {
  home.packages = with pkgs; [
    solaar
    kitty
    alacritty
    xdotool
    lxappearance
    baobab
    nitrogen
    vscode
    mpv
    feh
    zathura
    playerctl
    spotify
  ];
}
