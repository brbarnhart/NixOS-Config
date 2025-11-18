# git.nix

{ config, pkgs, lib, ... }:

{
    programs.git = {
      enable = true;
      userName = "brbarnhart";
      userEmail = "brbarnhart99@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
}
