# nvim.nix

{ pkgs, lib, config, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # Configuration will be done with dotfiles like normal
  };


  # Just for system dependencies like language servers
  environment.systemPackages = with pkgs; [
    clang-tools    

    # Nix dependencies
    nil
    statix
    deadnix
    alejandra

    #Lua dependencies
    lua-language-server
    selene
    stylua

  ];
}
