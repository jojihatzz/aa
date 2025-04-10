{ config, pkgs, ... }:

{
  home.username = "joji";
  home.homeDirectory = "/home/joji";

  programs.zsh.enable = true;
  programs.git.enable = true;

  # Link the customized VS Code settings.
  xdg.configFile."/home/joji/.config/Code/User/settings.json".source = ./files/vscode-settings.json;

  # Configure KDE global settings if applicable:
  xdg.configFile."kdeglobals".text = ''
    [General]
    colorScheme=Whitesur-Dark

    [Icons]
    Theme=Whitesur-Dark
  '';

  # Configure KDE mouse settings.
  xdg.configFile."kcminputrc".text = ''
    [Mouse]
    cursorSpeed=0.40
    cursorAcceleration=0
  '';
}
