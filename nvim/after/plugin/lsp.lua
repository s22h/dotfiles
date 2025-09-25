vim.opt.signcolumn = 'yes'

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

