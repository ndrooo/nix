{ pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [];

  environment.systemPackages = with pkgs; [
    rustc
    cargo
    nil
    nixd
  ];

}