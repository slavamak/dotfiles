if vim.fn.has 'nvim-0.8' == 0 then
  vim.schedule(function()
    vim.notify(
      'Unsupported Neovim Version! Please check the requirements',
      'error'
    )
  end)
end

require 'slavamak.base'
require 'slavamak.bootstrap'
require 'slavamak.plugins'
