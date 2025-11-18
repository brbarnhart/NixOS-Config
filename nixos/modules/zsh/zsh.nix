# zsh.nix

{ pkgs, lib, config, ... }:

{
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.ben = { pkgs, inputs, ... }: {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zsh = {
      enable = true;
      #dotDir = ".config/zsh";
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        "nhs" = "nh os switch ~/mysystem/";
        "ls" = "ls --color";
      };

      history = {
        size = 5000;
        expireDuplicatesFirst = true;
        findNoDups = true;
        ignoreAllDups = true;
        ignoreDups = true;
        saveNoDups = true;
        append = true;
        share = true;
      };

      plugins = [
        {
          name = pkgs.zsh-fzf-tab.pname;
          src = pkgs.zsh-fzf-tab.src;
        }
        {
          name = pkgs.zsh-vi-mode.pname;
          src = pkgs.zsh-vi-mode.src;
        }
      ];

      initContent = lib.mkOrder 1200 ''
        echo "Aliases loaded"
        # Completion styling
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-za-z}'
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      '';
    };
    programs.oh-my-posh = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./zen.toml);
    };
  };
}
