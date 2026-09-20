-- Keymaps are automatically loaded on the VeryLazy event.
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

-- Remove LazyVim keymaps I don't use. pcall so an upstream rename doesn't
-- break startup. Lazy-loaded plugin keys are disabled in their plugin spec.
local function unmap(lhs)
	pcall(vim.keymap.del, "n", lhs)
end

map("n", "<leader>rs", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

unmap("<leader>bb")
unmap("<leader>K")
unmap("<leader>`")
unmap("<leader>bD")
unmap("<leader>uA")
unmap("<leader><tab><tab>")
unmap("<leader><tab>]")
unmap("<leader><tab>[")
unmap("<leader><tab>d")
unmap("<leader><tab>f")
unmap("<leader><tab>l")
unmap("<leader><tab>o")

-- Hide maps from which-key
require("which-key").add({
	{ "<leader>rs", hidden = true },
	{ "<leader>L", hidden = true },
	{ "<leader>uI", hidden = true },
	{ "<leader>ui", hidden = true },
	{ "<leader>ul", hidden = true },
	{ "<leader>uL", hidden = true },
	{ "<leader>uT", hidden = true },
	{ "<leader>uh", hidden = true },
	{ "<leader>uf", hidden = true },
	{ "<leader>uC", hidden = true },
	{ "<leader>ua", hidden = true },
	{ "<leader>uA", hidden = true },
	{ "<leader>ug", hidden = true },
	{ "<leader>uG", hidden = true },
	{ "<leader>us", hidden = true },
	{ "<leader>uS", hidden = true },
})
