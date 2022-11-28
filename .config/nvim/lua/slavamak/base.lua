vim.cmd 'autocmd!'

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = { space = '·', tab = '->' }
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.opt.hlsearch = true

-- Syntax support for postcss files
vim.api.nvim_create_autocmd({ 'Bufread', 'BufNewFile' }, {
  pattern = { '*.css', '*.postcss' },
  command = 'set filetype=scss',
})
