return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "odin" },
			callback = function(args)
				vim.treesitter.start(args.buf)
			end,
		})
		require("nvim-treesitter").install({ "cpp", "c", "odin", "python", "typescript", "javascript", "go" })
	end,
}
