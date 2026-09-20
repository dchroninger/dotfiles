return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			transparent_background = true,
			float = { transparent = true },
			auto_integrations = true,
		},
	},
	{
		"LazyVim/LazyVim",
		opts = { colorscheme = "catppuccin-mocha" },
	},
}
