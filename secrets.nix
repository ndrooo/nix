let
  ndrooo_kiwi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhQKBp+aYcvMtHWUp6X3aUIfglWEl+6LcU/XrqdnWNC ndrooo@kiwi";
  root_xana = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICC8pQN8PMmVxWaOWs5yu4MRnKN3OnjBQNsSiUJDQ++Y root@xana";
  ndrooo_lyoko = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNFduZVzZWQK7zP8ji/+nqwF4YsTEwLOY1ZoOdr4Up7 ndrooo@lyoko";
in
{
  "secrets/ddclient.age".publicKeys = [ root_xana ];
  "secrets/ssh.age".publicKeys = [
    ndrooo_kiwi
    ndrooo_lyoko
  ];
}
