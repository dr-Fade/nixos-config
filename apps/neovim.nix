{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        configure = {
            customRC = ''
                set number
                set list
                set tabstop=4
                set shiftwidth=4
                set expandtab
            '';
        };
        viAlias = true;
        vimAlias = true;
    };
}
