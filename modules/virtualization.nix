{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.managed = true;

  environment.systemPackages = with pkgs; [
    qemu         # Virtual machine emulator.
    virt-manager # Graphical VM management tool.
  ];
}
