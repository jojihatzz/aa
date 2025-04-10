{ config, pkgs, ... }:

let
  # Define a VS Code package with pre‑installed extensions.
  vscodeWithExtensions = pkgs.vscode-with-extensions.override {
    extensions = with pkgs.vscode-extensions; [
      jojihatzz.codemapper
      jojihatzz.c0mmentremover
      jojihatzz.grandblue
    ];
  };
in {
  imports = [
    ./hardware.nix                   # Hardware configuration
    ../../modules/base.nix           # Global system settings
    # Uncomment the next line to use Hyprland instead of KDE:
    # ../../modules/desktop/hyprland.nix
    ../../modules/users/joji.nix     # User "joji" configuration
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.networkmanager.enable = true;
  networking.firewall.enable = true;
  services.bluetooth.enable = true;
  services.printing.enable = true;
  services.fwupd.enable = true;

  time.timeZone = "Europe/Athens";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  environment.systemPackages = with pkgs; [
    git
    google-chrome
    vlc
    mediawriter
    spotify
    neovim
    discord
    neofetch
    starship
    vscodeWithExtensions
    htop
    python313
    pipewire
    gufw
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
  };
}
