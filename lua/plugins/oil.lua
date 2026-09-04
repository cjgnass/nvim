return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["<C-h>"] = false,
			["<C-l>"] = false,
			["gr"] = "actions.refresh",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}
