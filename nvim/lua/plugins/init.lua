local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit ..." }
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"dracula/vim",
			name = "dracula",
			lazy = false,
			priority = 1000,
		},
		{
			"ellisonleao/gruvbox.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd.colorscheme("gruvbox")
			end
		},
		{
			"sainnhe/everforest",
			lazy = false,
			priority = 1000,
			config = function()
				vim.g.everforest_enable_italic = true
			end
		},
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				{ "nvim-lua/plenary.nvim" }
			}
		},
		{ "tpope/vim-fugitive" },
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{
			"dense-analysis/ale",
			config = function()
				vim.g.ale_linters = {
					typescript = { "eslint", "tsserver" },
					typescriptreact = { "eslint", "tsserver" }
				}
			end
		},
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }
	}
})

