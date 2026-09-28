local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.o.wrap = false
vim.o.swapfile = false
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 999
vim.opt.ignorecase = true
vim.opt.smartcase = true

require("lazy").setup("plugins")
-- vim.cmd.colorscheme("tokyonight")
vim.cmd("colorscheme github_dark_dimmed")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-q>", [[<C-\><C-n><cmd>bd!<CR>]])
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>so", "<cmd>only<CR>", { desc = "Only" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>X", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end, { desc = "Close all other buffers" })
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end
vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.open_float({ scope = "line" })
end, { desc = "Show diagnostic" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP References" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Implementation" })
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "gp", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to diagnostic" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
if vim.uv.os_uname().sysname == "Windows_NT" then
	vim.keymap.set("n", "<M-h>", "<cmd>vertical resize +5<CR>")
	vim.keymap.set("n", "<M-l>", "<cmd>vertical resize -5<CR>")
	vim.keymap.set("n", "<M-j>", "<cmd>resize +5<CR>")
	vim.keymap.set("n", "<M-k>", "<cmd>resize -5<CR>")
else
	vim.keymap.set("n", "<C-S-h>", "<cmd>vertical resize +5<CR>")
	vim.keymap.set("n", "<C-S-l>", "<cmd>vertical resize -5<CR>")
	vim.keymap.set("n", "<C-S-j>", "<cmd>resize +5<CR>")
	vim.keymap.set("n", "<C-S-k>", "<cmd>resize -5<CR>")
end

-- nvim-telescope/telescope.nvim
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>sm", "<cmd>Telescope marks<CR>", { desc = "Telescope marks" })

-- stevearc/oil.nvim
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Oil" })

-- mbbill/undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })

-- nvim-treesitter
vim.keymap.set("n", "<leader>ti", vim.cmd.InspectTree, { desc = "Inspect tree" })

-- nvim-neo-tree/neo-tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Inspect tree" })
