local function augroup(name)
  return vim.api.nvim_create_augroup('augroup_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup 'highlight_yank',
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt_local.colorcolumn = '0'
  end,
  group = augroup 'transparent_cc',
  pattern = 'netrw',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.api.nvim_set_hl(0, 'LspInfoBorder', { link = 'FloatBorder' })
    vim.api.nvim_win_set_config(0, { border = vim.g.border_chars })
  end,
  group = augroup 'lsp_border',
  pattern = { 'lspinfo', 'lsp-installer' },
})
