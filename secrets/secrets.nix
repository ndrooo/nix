let
  lyoko = "";
  kiwi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXpG+hRrhYEWhrrtGpQw7VnGc+TnCFY4Nl2HP1uSHFk root@kiwi";
  xana = "";
  hosts = [ lyoko kiwi xana ];
in
{
  "home-wifi.age".publicKeys = hosts;
}