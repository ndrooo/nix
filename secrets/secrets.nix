let
  root_kiwi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXpG+hRrhYEWhrrtGpQw7VnGc+TnCFY4Nl2HP1uSHFk root@kiwi";
  root_xana = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICC8pQN8PMmVxWaOWs5yu4MRnKN3OnjBQNsSiUJDQ++Y root@xana";
in
{
  "ddclient.age".publicKeys = [ root_xana ];
}
