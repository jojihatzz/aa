{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    steam          # Steam client with Proton support.
    lutris         # Game launcher and library manager.
    openrgb        # RGB hardware control utility.
    vulkan-loader  # Vulkan API loader.
    vulkan-tools   # Vulkan diagnostic tools.
    mesa-demos     # OpenGL demo applications.
  ];

  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
}
