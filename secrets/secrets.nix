let
  lyoko = "";
  kiwi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXpG+hRrhYEWhrrtGpQw7VnGc+TnCFY4Nl2HP1uSHFk root@kiwi";
  xana = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM6aqQ2bH4RWya6z2/4sZ5rqlhGRzIIP++moIZ579J/5 root@xana";
  hosts = [ lyoko kiwi xana ];
in
{
  "ddclient.age".publicKeys = hosts;
}
