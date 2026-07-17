{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./shell/bashrc;
  };

  home.file.".config/gammastep/config.ini".source = ./shell/config.ini;
}
