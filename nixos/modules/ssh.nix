# ssh.nix

{ pkgs, lib, config, ... }:

{
  services.openssh = {
    enable = true;
  };
  programs.ssh = {
    extraConfig = "
      Host homelab0
        Hostname 192.168.0.75
        Port 22
        User homelab0
    ";
  };
}
