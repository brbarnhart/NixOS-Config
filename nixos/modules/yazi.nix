{ pkgs, lib, config, ... }:

{

  home-manager.users.ben = { pkgs, inputs, ... }: {
    programs.yazi = {
      enable = true;
      shellWrapperName = "y";
      #keymap = {
      #  mgr.prepend_keymap = [
      #    {
      #      on  = [ "g" "m" ];
      #      run = '''cd /run/media/ben/ || notify "USB mount directory not found"''';
      #      desc = "Cd to USB mounts";
      #    }
      #    {
      #      on   = [ "g" "p" ];
      #      run  = "cd ~/Pictures";
      #      desc = "Cd to ~/Pictures";
      #    }
      #    {
      #      on = ["t"];
      #      run = "notify 'Keymap is working!'";
      #      desc = "Test notification";
      #    }
      #  ];
      #};
    };
  };
}
