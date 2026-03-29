return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{
				"<leader>fe",
				function()
					---@diagnostic disable-next-line: undefined-global
					require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
				end,
				desc = "Explorer NeoTree (Root Dir)",
			},
			{ "<leader>e", false },
			{ "<leader>ge", false },
			{ "<leader>be", false },
			{ "<leader>fE", false },
		},
	},
}
