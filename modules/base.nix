{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fonts.fonts = with pkgs; [
    noto-fonts
    liberationFonts
  ];

  security.sandbox.allowAll = false;

  # Note: Even though flakes are not used here,
  # the experimental features line is kept if desired.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
