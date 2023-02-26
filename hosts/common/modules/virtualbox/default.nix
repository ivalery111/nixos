{ pkgs, ...}:
{
  virtualisation.virtualbox = {
    host.enable              = true;
    host.enableExtensionPack = true;
    host.addNetworkInterface = true;

    guest.enable = true;

  };
  users.extraGroups.vboxusers.members = [ "valery" ];
}
