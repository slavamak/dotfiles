local bind = require('util').bind()

bind('n', '<leader>pv', vim.cmd.Ex, 'File Explorer')
bind('i', 'jk', '<esc>', 'Escape')
bind({ 'n', 'v', 'i' }, '<leader>qq', '<cmd>qa!<cr>', 'Exit Neovim')

bind('n', 'л', 'gk', 'Up')
bind('n', 'о', 'gj', 'Down')
bind('n', 'р', 'h', 'Left')
bind('n', 'д', 'l', 'Right')

bind('n', '[c', function()
  require('treesitter-context').go_to_context()
end, 'Jumping to context')
