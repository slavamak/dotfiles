local M = {}

M.bind = function(opts)
  return function(mode, keys, callback, descOrOpts)
    local options = {}

    if type(opts) == 'table' then
      for k, v in pairs(opts) do
        options[k] = v
      end
    end

    if type(descOrOpts) == 'table' then
      for k, v in pairs(descOrOpts) do
        options[k] = v
      end
    else
      options.desc = descOrOpts
    end

    vim.keymap.set(mode, keys, callback, options)
  end
end

M.toggle_netrw = function()
  if vim.g.netrw_is_open == 1 then
    for i = 1, vim.fn.bufnr '$' do
      if vim.fn.getbufvar(i, '&filetype') == 'netrw' then vim.cmd('bdelete ' .. i) end
    end
    vim.g.netrw_is_open = 0
  else
    vim.g.netrw_is_open = 1
    vim.cmd 'Explore'
  end
end

return M
