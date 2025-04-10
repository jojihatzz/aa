{ config, pkgs, ... }:

{
  imports =
    [
      ./hosts/nixos/hardware.nix        # Hardware detection and kernel module settings
      ./hosts/nixos/default.nix         # Bootloader, basic services, and host-specific settings
      ./modules/base.nix                # Global options (allowUnfree, fonts, security, etc.)
      ./modules/desktop/kde.nix         # KDE Plasma 6 desktop configuration
      # Uncomment the following line to use Hyprland instead:
      # ./modules/desktop/hyprland.nix
      ./modules/users/joji.nix          # User "joji" configuration
      ./modules/virtualization.nix      # Virtualization support (libvirt)
      ./modules/gaming.nix              # Gaming packages and AMD GPU tweaks
    ];

  # (Optional) To integrate Home Manager into your system configuration,
  # install Home Manager as a NixOS module and add:
  #
  # imports = [ <home-manager/nixos> ];
  #
  # Then include your home configuration, for example:
  #
  # home-manager.users.joji = import ./home/joji.nix;
}
