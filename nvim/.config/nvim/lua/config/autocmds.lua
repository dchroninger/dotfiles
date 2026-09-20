-- Autocmds are automatically loaded on the VeryLazy event.
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local function augroup(name)
	return vim.api.nvim_create_augroup("dave_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("markdown_conceal"),
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.conceallevel = 1
	end,
})

-- go templates
vim.filetype.add({
	extension = {
		gohtml = "gotmpl",
		gotmpl = "gotmpl",
	},
	pattern = {
		[".*%.html"] = {
			function(_, bufnr)
				local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 200, false)
				for _, line in ipairs(lines) do
					if line:find("{{.+}}") then
						return "gotmpl"
					end
				end
			end,
			{ priority = -math.huge },
		},
	},
})
