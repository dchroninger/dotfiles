return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian: quick switch" },
			{ "<leader>os", "<cmd>Obsidian search<cr>", desc = "Obsidian: search" },
			{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian: new note" },
			{ "<leader>od", "<cmd>Obsidian today<cr>", desc = "Obsidian: daily note" },
			{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian: backlinks" },
			{ "<leader>ow", "<cmd>Obsidian workspace<cr>", desc = "Obsidian: switch vault" },
		},
		opts = {
			legacy_commands = false,
			workspaces = {
				{ name = "personal", path = "~/vaults/personal-vault" },
				{ name = "work", path = "~/vaults/work-vault" },
				{ name = "dahlia", path = "~/vaults/dahlia" },
				{ name = "book", path = "~/vaults/book" },
				{ name = "haven", path = "~/vaults/haven" },
			},
			picker = { name = "fzf-lua" },
			-- render-markdown.nvim (LazyVim markdown extra) handles in-buffer rendering
			ui = { enable = false },
		},
	},
	{
		"folke/which-key.nvim",
		opts = { spec = { { "<leader>o", group = "obsidian" } } },
	},
}
