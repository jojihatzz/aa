{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdeApplications.konsole
    kdeApplications.kate
    kdeApplications.kdeplasma-addons
    whitesur-dark-kde  # Provides the Whitesur Dark theme and icon theme.
  ];
}
