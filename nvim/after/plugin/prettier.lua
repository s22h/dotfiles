vim.g.ale_fixers = {
	['javascript'] = { 'prettier' },
	['typescript'] = { 'prettier' },
	['typescriptreact'] = { 'prettier' },
	['svelte'] = { 'prettier' },
	['css'] = { 'prettier' },
	['lua'] = { 'lua-format' }
}

vim.g.ale_linters_explicit = 1

vim.keymap.set('n', '<leader>fix', vim.cmd.ALEFix)

