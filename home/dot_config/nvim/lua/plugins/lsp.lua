return {
	{
		"neovim/nvim-lspconfig",
		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()

			keys[#keys + 1] = { "<leader>cR", false }
			keys[#keys + 1] = { "<leader>cl", false }
			keys[#keys + 1] = { "<leader>cc", false }
			keys[#keys + 1] = { "<leader>cC", false }
		end,
	},
}
