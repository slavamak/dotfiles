local bind = require('util').bind()

bind('n', '<leader>pv', '<cmd>Ex<cr>', 'Project view')
bind('i', 'jk', '<esc>', 'Escape')
bind('n', '<leader>Q', '<cmd>qa!<cr>', 'Exit neovim')

bind('v', 'J', ":m '>+1<cr>gv=gv", 'Move selection Down')
bind('v', 'K', ":m '<-2<cr>gv=gv", 'Move election Up')

bind({ 'n', 'v' }, '<leader>y', [["+y]], 'Copy to system clipboard')
bind('n', '<leader>Y', [["+Y]], 'Copy a line to system clipboard')

bind('n', 'л', 'gk', 'Cursor Up')
bind('n', 'о', 'gj', 'Cursor Down')
bind('n', 'р', 'h', 'Cursor Left')
bind('n', 'д', 'l', 'Cursor Right')

bind('n', '[c', function()
  require('treesitter-context').go_to_context()
end, 'Jumping to context')

bind('n', '<leader>pf', '<cmd>Telescope find_files<cr>', 'Project files')
bind('n', '<leader>g', '<cmd>Telescope git_files<cr>', 'Git files')
bind('n', '<c-p>', '<cmd>Telescope oldfiles<cr>', 'Recently opened')
bind('n', '<leader>b', '<cmd>Telescope buffers<cr>', 'Buffer list')
bind('n', '<leader>h', '<cmd>Telescope help_tags<cr>', 'Help tags')
bind({ 'n', 'v' }, '<leader>gs', '<cmd>Telescope grep_string<cr>', 'Grep search')
bind('n', '<leader>m', '<cmd>Telescope keymaps<cr>', 'Keymaps list')

bind('n', '<leader>j', '<cmd>bprevious<cr>', 'Go to previous buffer')
bind('n', '<leader>k', '<cmd>bnext<cr>', 'Go to next buffer')
bind('n', '<leader>c', '<cmd>bprevious <bar> bdelete #<cr>', 'Close buffer')
bind('n', '<leader>q', '<c-w>q', 'Quit a window')
bind('n', '<leader>w', '<c-w>w', 'Switch windows')

bind('n', '<leader>s', [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gI<left><left><left>]], 'Search and replace')
bind({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', 'Clear highlight search')
