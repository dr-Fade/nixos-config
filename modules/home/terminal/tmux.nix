{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };
  
  # Ensure the .tmux/plugins/ directory exists for TPM.
  home.file = {
    ".tmux/plugins/.gitkeep".text = "";
  };
}
