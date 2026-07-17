{ pkgs, ... }: {
  # NeoVim is too complex for a simple settings attr (pure Lua setup)
  # We use the source option to link the whole config directory.
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = ./nvim;
}
