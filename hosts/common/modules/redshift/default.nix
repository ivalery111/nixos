{ pkgs, ...}:
{
  home-manager.users.valery.services.redshift = {
    enable = true;
    tray = true;
    longitude = "37.61556";
    latitude  = "55.75222";
  };

  # Set redshift config
  #home-manager.users.valery.xdg.configFile."redshift/redshift.conf" = {
  #  source = ../../config/redshift/redshift.conf;
  #};
}
