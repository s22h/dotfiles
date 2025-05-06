vim.opt.signcolumn = 'yes'

local lspconfig = require("lspconfig")

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }
	
		vim.cmd('command! LspFormat lua vim.lsp.buf.format()')
		vim.keymap.set('n', '<leader>df', function() vim.lsp.buf.format() end, opts)

		-- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
		-- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
	end
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({})
		end
	}
})

lspconfig.ts_ls.setup({
	--root_dir = vim.lsp.util.root_pattern('package.json')
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer', keyword_length = 3}
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<Enter>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4)
	})
})

