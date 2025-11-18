# plasma6.nix
{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konqueror              # ancient web browser/file manager
    khelpcenter
    elisa                  # music player
    dragon                 # video player
    gwenview               # image viewer
    okular                 # PDF viewer
    kate                   # text editor
    ark                    # archive manager
    #kwrite
    dolphin                # file manager (optional – remove if you want something lighter like pcmanfm-qt)
    dolphin-plugins
    ffmpegthumbs
    kdegraphics-thumbnailers
    kio-extras
    kio-extras-kf5
    #thumbnailers
    baloo                  # file indexing/search (big resource hog)
    k3b                    # CD burning
    kwalletmanager
    spectacle              # screenshot tool
    print-manager
    discover               # software center
    packagekit-qt
    kinfocenter
    isoimagewriter
    # Games
    kmahjongg kmines kpat kajongg kgoldrunner kigo
    kiriki kjumpingcube klines knavalbattle kspaceduel ksudoku
    # Other minor stuff
    plasma-welcome
    skanpage skanlite
    yakuake                # drop-down terminal (if you don't use it)
  ];

}
