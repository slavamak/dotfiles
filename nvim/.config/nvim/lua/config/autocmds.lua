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

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    require('modules.lualine').setup()
  end,
  group = augroup 'lualine_update_theme_colors',
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local is_large_or_minified = require('util').is_large_or_minified(args.buf)
    if not is_large_or_minified then
      local matching_configs = require('lspconfig.util').get_config_by_ft(args.match)
      for _, config in ipairs(matching_configs) do
        config.launch(args.buf)
      end
    end
  end,
  group = augroup 'lsp_manually_start_server',
  pattern = '*',
})
