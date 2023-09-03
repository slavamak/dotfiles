-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move the cursor using Russian layout
vim.keymap.set('n', 'л', 'gk', opts)
vim.keymap.set('n', 'о', 'gj', opts)
vim.keymap.set('n', 'р', 'h', opts)
vim.keymap.set('n', 'д', 'l', opts)
