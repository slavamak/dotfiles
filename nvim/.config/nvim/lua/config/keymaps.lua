local bind = require('util').bind()

bind('n', '<leader>pv', '<cmd>Ex<cr>', 'File Explorer')
bind('i', 'jk', '<esc>', 'Escape')
bind({ 'n', 'v', 'i' }, '<leader>qq', '<cmd>qa!<cr>', 'Exit Neovim')

bind('v', 'J', ":m '>+1<CR>gv=gv", 'Move selection Down')
bind('v', 'K', ":m '<-2<CR>gv=gv", 'Move election Up')

bind({ 'n', 'v' }, '<leader>y', [["+y]], 'Copy to system clipboard')
bind('n', '<leader>Y', [["+Y]], 'Copy a line to system clipboard')

bind('n', 'л', 'gk', 'Cursor Up')
bind('n', 'о', 'gj', 'Cursor Down')
bind('n', 'р', 'h', 'Cursor Left')
bind('n', 'д', 'l', 'Cursor Right')

bind('n', '[c', function()
  require('treesitter-context').go_to_context()
end, 'Jumping to context')

bind(
  'n',
  '<leader>s',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  'Search and replace using the word under the cursor'
)
