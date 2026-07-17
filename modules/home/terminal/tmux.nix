{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };
  
  # TPM plugins are usually managed by the tmux plugin manager 
  # but we need to ensure the directory exists for them to be installed into.
  home.file.".tmux/plugins".create = true;
}
