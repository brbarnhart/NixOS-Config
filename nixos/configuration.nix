# configuration.nix

{ inputs, config, pkgs, lib, ... }:

let
  system = "x86_64-linux";
in
{
  ###--------General Nix Settings--------###
  system.stateVersion = "24.11"; # <---- DO NOT CHANGE
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "ben" ];
  

  imports =
    [
      inputs.home-manager.nixosModules.home-manager
      ./hardware-configuration.nix
      #./modules/hyprland.nix
      ./modules/plasma6.nix
      ./modules/bootLoader.nix
      ./modules/audio.nix
      ./modules/system_settings.nix
      ./modules/users.nix
      ./modules/ssh.nix
      ./modules/zsh/zsh.nix
      ./modules/yazi.nix
      ./modules/nvim.nix
    ];

  ###-----------------Desktop Environment-----------------###
    #services.displayManager.sddm = {
    #  enable = true;
    #  wayland.enable = true;
    #  defaultSession = "hyprland";
    #};
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd startplasma-wayland";
        user = "greeter";  # Optional: runs greeter as this user for isolation
      };
    };
  };
  services.xserver.enable = true;

  home-manager.backupFileExtension = "backup";
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.ben = { pkgs, ... }: {
    imports = [
      ./home-modules/git.nix
      ./home-modules/steam_launch_opts.nix
    ];
    home.packages = [ pkgs.atool pkgs.httpie ];

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11"; # <---- DO NOT CHANGE
  };

  ###------------------Fonts------------------###
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [ 
    nerd-fonts.jetbrains-mono 
  ];

  ###------------------Automountin------------------###
  services.udisks2.enable = true;

  ###-------------Programs/Packages--------------###
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.nix-ld.enable = true;
  programs.nh = {
    enable = true;
    flake = "/home/ben/mysystem";
  };

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
  environment.variables.EDITOR = "nvim";

  environment.systemPackages = with pkgs; [
    anki
    brave
    obsidian
    protonup
    nss
    zotero

    # Games
    discord
    gale
    prismlauncher

    # Coding
    devenv
    rstudio
    wezterm
    zed-editor

    # System utilities
    efibootmgr
    gparted
    killall
    steam-run
    stow
    udiskie
    usbutils

    # Engineering
    ergogen
    freecad
    kicad
    orca-slicer
    prusa-slicer

    # Screenshot utilities
    grim
    slurp
    wl-clipboard
    swappy
  ];

}
