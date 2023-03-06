{ pkgs, ... }: {
  home.packages = with pkgs; [
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
