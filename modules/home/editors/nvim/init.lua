require("config.lazy")

-- editor
vim.opt.number = true
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi NonText ctermbg=NONE guibg=NONE")

-- text
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- lsp
require("lspconfig").lua_ls.setup({})
require("lspconfig").julials.setup({})
require("lspconfig").bashls.setup({})
