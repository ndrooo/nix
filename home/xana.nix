{ pkgs, ... }: {
  imports = [
    ./base.nix
    modules.cli
  ];
}
