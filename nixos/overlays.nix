# overlays.nix
{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      gamescope = super.gamescope.overrideAttrs (oldAttrs: rec {
        #        version = "3.16.2";
        src = self.fetchFromGitHub {
          owner = "ValveSoftware";
          repo = "gamescope";
          rev = "refs/tags/3.16.2";
          sha256 = "1xcrjb9fbp8d3kz4shc2n632xrd66pch4khwri77hybbwfpiibf3";
        };
      });
    })
    # (self: super: {
    #   hyprsplit = super.gamescope.overrideAttrs (oldAttrs: rec {
    #     #        version = "3.16.2";
    #     src = self.fetchFromGitHub {
    #       owner = "shezdy";
    #       repo = "hyprsplit";
    #       rev = "refs/tags/0.49.0";
    #       sha256 = "1xcrjb9fbp8d3kz4shc2n632xrd66pch4khwri77hybbwfpiibf3";
    #     };
    #   });
    # })
  ];
}
