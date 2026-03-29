local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("markdown_conceal"),
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.conceallevel = 1
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.gohtml,*.gotmpl,*.html",
	callback = function()
		if vim.fn.search("{{.\\+}}", "nw") ~= 0 then
			local buf = vim.api.nvim_get_current_buf()
			vim.api.nvim_set_option_value("filetype", "gotmpl", { buf = buf })
			vim.api.nvim_set_option_value("filetype", "html", { buf = buf })
		end
	end,
})
