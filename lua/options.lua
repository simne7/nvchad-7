require "nvchad.options"

vim.opt.exrc = true

-- Disable initial folding 
vim.opt.foldenable = false

-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Virtual column at char 120
vim.opt.colorcolumn = "120"
