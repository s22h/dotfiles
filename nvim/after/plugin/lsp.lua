local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	
	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

	vim.diagnostic.config({
		virtual_text = true
	})
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities()
})

local cmp = require('cmp')

cmp.setup({
	sources = {{ name = 'nvim_lsp' }},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({})
})

