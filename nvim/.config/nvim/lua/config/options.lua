-- Options are automatically loaded before lazy.nvim startup.
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt

vim.g.lazyvim_picker = "fzf"

opt.swapfile = false
opt.backup = false
opt.isfname:append("@-@")

-- treesitter folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
