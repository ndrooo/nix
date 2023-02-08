# Common configuration for all home-manager hosts

{
  nixpkgs = {
    # You can add overlays here
    overlays = [];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home.username = "ndrooo";
  home.homeDirectory = "/home/ndrooo";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  programs.git.userName = "ndrooo";
  programs.git.userEmail = "git@ndr.ooo";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
