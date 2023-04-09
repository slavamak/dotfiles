return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'shellcheck' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'bash' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        bashls = {
          filetypes = { 'sh', 'bash', 'zsh' },
        },
      },
    },
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require 'null-ls'

      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.shellcheck.with {
          extra_filetypes = { 'bash' },
        },
        nls.builtins.diagnostics.shellcheck.with {
          extra_filetypes = { 'bash' },
        },
        nls.builtins.diagnostics.zsh,
      })
    end,
  },
}
