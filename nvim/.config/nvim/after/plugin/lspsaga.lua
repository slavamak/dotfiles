local status, saga = pcall(require, 'lspsaga')
if not status then return end

saga.setup {}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
