return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "clangd", "pyright", "neocmake", "rust_analyzer", "ast_grep", "ols" },
		})
		vim.lsp.config("pyright", {
			settings = {
				python = {
					pythonPath = [[C:\Users\cjgnass\AppData\Local\Microsoft\WindowsApps\py.exe]],
				},
			},
		})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
}
