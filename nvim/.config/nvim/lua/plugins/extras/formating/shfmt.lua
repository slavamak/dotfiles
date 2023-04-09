return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'shfmt' })
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require 'null-ls'

      table.insert(
        opts.sources,
        nls.builtins.formatting.shfmt.with {
          extra_args = { '-i', '2', '-s', '-ci', '-sr', '-ln', 'bash' },
          extra_filetypes = { 'bash', 'zsh' },
        }
      )
    end,
  },
}
