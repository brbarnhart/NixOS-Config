# hyprland.nix

{ pkgs, lib, config, inputs, ... }:

{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  home-manager.users.ben = { pkgs, inputs, ... }: {
    imports = [
      inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
    ];
    home.packages = with pkgs; [
      dunst
      libnotify
      rofi

      swaylock
      wlogout

      nwg-displays

      phinger-cursors
    ];

    home.pointerCursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 32;
      x11.enable = true;
      gtk.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.configPackages = [ pkgs.xdg-desktop-portal-gtk ];
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    programs.waybar.enable = true;
    programs.hyprcursor-phinger.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
      extraConfig = "source=~/.config/hypr/main.conf";
      plugins = [
        inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      ];
    };
  };
}
