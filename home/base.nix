# Common configuration for all home-manager hosts
{ inputs, config, ... }:

let
  modules = import ./modules;
in {
  imports = [
    inputs.agenix.homeManagerModules.default
    modules.firefox_webapp
  ];

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

  programs.git.settings.user.name = "ndrooo";
  programs.git.settings.user.email = "git@ndr.ooo";
  programs.git.settings.init.defaultBranch = "main";

  age.identityPaths = ["/home/ndrooo/.ssh/id_ed25519"];
  age.secrets.ssh.file = ../secrets/ssh.age;
  age.secrets.ssh.path = "$HOME/.ssh/hosts.config";

  programs.ssh = {
    enable = true;
    extraConfig = ''
      IdentityFile ~/.ssh/id_ed25519
    '';
    matchBlocks.gh = {
      user = "git";
      hostname = "github.com";
    };
    includes = [ "hosts.config" ];
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
