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
		-- Code parsing
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		-- Fuzzy list search
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				{ "nvim-lua/plenary.nvim" }
			}
		},
		-- Git tools
		{ "tpope/vim-fugitive" },
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Auto completion
		{
			"saghen/blink.cmp",
			version = "1.*",
			opts = {
				keymap = { preset = "default" },
				appearance = {
					nerd_font_variant = "mono"
				}
			}
		},
		-- Linting
		{
			"dense-analysis/ale",
			config = function()
				vim.g.ale_linters = {
					typescript = { "eslint", "tsserver" },
					typescriptreact = { "eslint", "tsserver" }
				}
			end
		}
	}
})

