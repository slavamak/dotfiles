vim.keymap.set('n', 'л', 'gk')
vim.keymap.set('n', 'о', 'gj')
vim.keymap.set('n', 'р', 'h')
vim.keymap.set('n', 'д', 'l')

vim.keymap.set('n', '[c', function()
  require('treesitter-context').go_to_context()
end)
