-- Languages not covered by a LazyVim extra: swift, bash, html, css, xml, go templates.
-- (ts/js/go/python/sql/json/markdown/tailwind/java/c++ come from extras in lazyvim.json)
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "css", "scss", "swift", "gotmpl" } },
	},
	{
		"mason-org/mason.nvim",
		opts = { ensure_installed = { "shfmt", "shellcheck" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- html + go templates share the html language server
				html = {
					filetypes = { "html", "gotmpl" },
					get_language_id = function()
						return "html"
					end,
				},
				cssls = {},
				bashls = {},
				lemminx = {}, -- xml
				-- swift: sourcekit-lsp ships with Xcode, not mason
				sourcekit = { mason = false },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {
					filetypes_include = { "gotmpl" },
					settings = {
						tailwindCSS = { includeLanguages = { gotmpl = "html" } },
					},
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },
				swift = { "swift" }, -- `swift format`, bundled with Xcode/Swift 6+
			},
		},
	},
}
