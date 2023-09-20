local bind = require('util').bind()

bind('n', '<Leader>pv', '<Cmd>Ex<Cr>', 'Project view')
bind('i', 'jk', '<Esc>', 'Escape')
bind('n', '<Leader>Q', '<Cmd>qa!<Cr>', 'Exit neovim')

bind('v', 'J', ":m '>+1<Cr>gv=gv", 'Move selection Down')
bind('v', 'K', ":m '<-2<Cr>gv=gv", 'Move election Up')

bind({ 'n', 'v' }, '<Leader>y', [["+y]], 'Copy to system clipboard')
bind('n', '<Leader>Y', [["+Y]], 'Copy a line to system clipboard')

bind('n', 'л', 'gk', 'Cursor Up')
bind('n', 'о', 'gj', 'Cursor Down')
bind('n', 'р', 'h', 'Cursor Left')
bind('n', 'д', 'l', 'Cursor Right')

bind('n', '[c', function()
  require('treesitter-context').go_to_context()
end, 'Jumping to context')

bind('n', '<Leader>pf', '<Cmd>Telescope find_files<Cr>', 'Project files')
bind('n', '<c-p>', '<Cmd>Telescope git_files<Cr>', 'Git files')
bind('n', '<Leader>o', '<Cmd>Telescope oldfiles<Cr>', 'Recently opened')
bind('n', '<Leader>bl', '<Cmd>Telescope buffers<Cr>', 'Buffer list')
bind('n', '<Leader>vh', '<Cmd>Telescope help_tags<Cr>', 'View help')
bind({ 'n', 'v' }, '<Leader>ps', '<Cmd>Telescope grep_string<Cr>', 'Grep search')
bind('n', '<Leader>vk', '<Cmd>Telescope keymaps<Cr>', 'View keymaps')
bind('n', 'z=', '<Cmd>Telescope spell_suggest<Cr>', 'Suggest spellings')

bind('n', '<Leader>j', '<Cmd>bprevious<Cr>', 'Go to previous buffer')
bind('n', '<Leader>k', '<Cmd>bnext<Cr>', 'Go to next buffer')
bind('n', '<Leader>bd', '<Cmd>bprevious <bar> bdelete #<Cr>', 'Close buffer')
bind('n', '<Leader>q', '<C-w>q', 'Close window')
bind('n', '<Leader>w', '<C-w>w', 'Switch windows')

bind('n', '<Leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Search and replace')
bind({ 'i', 'n' }, '<Esc>', '<Cmd>noh<Cr><Esc>', 'Clear highlight search')
