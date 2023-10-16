local M = {}

function M.get_theme()
  local hl = vim.api.nvim_get_hl(0, { name = 'Lualine' })
  if not next(hl) then return 'auto' end

  local utils = require 'lualine.utils.utils'

  return {
    normal = {
      a = utils.extract_highlight_colors 'Lualine',
      b = utils.extract_highlight_colors 'Lualine',
      c = utils.extract_highlight_colors 'Lualine',
    },
    inactive = {
      a = utils.extract_highlight_colors 'LualineNC',
      b = utils.extract_highlight_colors 'LualineNC',
      c = utils.extract_highlight_colors 'LualineNC',
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
end

return M
