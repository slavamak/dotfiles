vim.api.nvim_create_autocmd({ 'Bufread', 'BufNewFile' }, {
  pattern = { '*.css', '*.postcss' },
  callback = function()
    vim.cmd 'set filetype=scss'
  end,
})
