return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				["*"] = {
					keys = {
						{ "<leader>cR", false },
						{ "<leader>cl", false },
						{ "<leader>cc", false },
						{ "<leader>cC", false },
					},
				},
			},
		},
	},
}
