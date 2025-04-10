{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.xterm.enable = false;
  };

  environment.systemPackages = with pkgs; [
    hyprland      # The Hyprland compositor.
    waybar        # Wayland status bar.
    hyprpaper     # Wallpaper manager for Hyprland.
    kitty         # Terminal emulator.
  ];

  xdg.configFile."hypr/hyprland.conf".source = ./files/hyprland.conf;
}
