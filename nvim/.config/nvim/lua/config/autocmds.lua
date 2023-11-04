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

vim.api.nvim_create_autocmd('User', {
  callback = function()
    local should_skip = false
    if vim.fn.argc() > 0 or vim.fn.line2byte(vim.fn.line '$') ~= -1 or not vim.o.modifiable then
      should_skip = true
    else
      for _, arg in pairs(vim.v.argv) do
        if arg == '-b' or arg == '-c' or vim.startswith(arg, '+') or arg == '-S' then
          should_skip = true
          break
        end
      end
    end
    if not should_skip then require('fsplash').open_window() end
  end,
  group = augroup 'fsplash_autostart',
  pattern = 'VeryLazy',
})

vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match 'NvimTree_' ~= nil then table.insert(tree_wins, w) end
      if vim.api.nvim_win_get_config(w).relative ~= '' then table.insert(floating_wins, w) end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
  group = augroup 'nvimtree_autoclose',
})
