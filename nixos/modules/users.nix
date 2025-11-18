# users.nix

{ pkgs, lib, config, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ben = {
    isNormalUser = true;
    description = "Ben";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };
}
