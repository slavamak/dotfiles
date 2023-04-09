return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'prettierd' })
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require 'null-ls'

      table.insert(
        opts.sources,
        nls.builtins.formatting.prettierd.with {
          extra_filetypes = { 'liquid' },
          disabled_filetypes = {
            'css',
            'scss',
            'less',
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
          },
        }
      )
    end,
  },
}
