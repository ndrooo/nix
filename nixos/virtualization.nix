{ pkgs, ... }: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["ndrooo"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}