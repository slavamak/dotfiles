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

return M
