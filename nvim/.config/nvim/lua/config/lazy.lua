local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup('plugins', {
  change_detection = {
    enabled = false,
  },
  defaults = {
    lazy = true,
  },
  install = { colorscheme = { 'github_light', 'tokyonight' } },
  ui = {
    border = vim.g.border_chars,
  },
})
