# steam_launch_opts.nix

{ config, pkgs, lib, ... }:

{
  xdg.desktopEntries.steam = {
    name = "Steam";
    exec = "steam --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
    type = "Application";
    terminal = false;
    icon = "steam";
    categories = [ "Game" ];
    mimeType = [ "x-scheme-handler/steam" ];
  };
}
