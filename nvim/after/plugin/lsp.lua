local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	
	-- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	-- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
	lsp_zero.default_keymaps(opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	float_border = 'rounded'
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end
	}
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
	}),
	formatting = lsp_zero.cmp_format({ details = true })
})

