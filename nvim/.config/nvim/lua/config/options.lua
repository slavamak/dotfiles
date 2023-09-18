vim.g.mapleader = ' '
vim.g.border_chars = 'rounded'

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.colorcolumn = '100'
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = { space = '·', tab = '->' }
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.opt.hlsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. '/.cache/nvim/undodir'
