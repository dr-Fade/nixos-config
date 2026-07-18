{ pkgs, ... }: {
  # Full LazyVim setup — managed entirely via symlinked config directory.
  # programs.neovim is NOT used because it generates .config/nvim/init.lua
  # which conflicts with the recursive symlink below.
  home.packages = [ pkgs.neovim ];

  home.file.".config/nvim".source = ./nvim;
}
