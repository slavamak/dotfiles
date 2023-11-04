local M = {}

function M.get_theme()
  local hl = vim.api.nvim_get_hl(0, { name = 'Lualine' })
  if not next(hl) then return 'auto' end

  local utils = require 'lualine.utils.utils'
  local normal = utils.extract_highlight_colors 'Lualine'
  local inactive = utils.extract_highlight_colors 'LualineNC'

  return {
    normal = {
      a = normal,
      b = normal,
      c = normal,
    },
    inactive = {
      a = inactive,
      b = inactive,
      c = inactive,
    },
  }
end

function M.setup(opts)
  if opts then M.opts = opts end

  if M.opts then
    if not M.opts.options then M.opts.options = {} end
    M.opts.options.theme = M.get_theme()
  end

  require('lualine').setup(M.opts)

  vim.defer_fn(function()
    vim.o.showtabline = 1
  end, 0)
end

return M
