vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.background = 'dark'
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.encoding = 'utf8'
vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.showbreak = '↪'
vim.opt.expandtab = false
vim.opt.colorcolumn = '81'
vim.opt.list = true
vim.opt.listchars = 'multispace:·,tab:→ ,nbsp:␣,trail:•,extends:»,precedes:«'
vim.opt.cursorline = true
vim.opt.showmode = true
vim.opt.showcmd = true

vim.cmd.colorscheme('molokai')
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

vim.g.mapleader = ' '
vim.g.localmapleader = '\\'

vim.keymap.set('', '<C-c>', '<Esc>')
vim.keymap.set('n', '<A-Up>', ':m -2<CR>')
vim.keymap.set('n', '<A-Down>', ':m +1<CR>')

require('plugins')

