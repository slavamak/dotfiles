return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = vim.g.border_chars,
      },
    },
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function()
      local nls = require 'null-ls'

      return {
        border = vim.g.border_chars,
        sources = {
          nls.builtins.completion.spell,
        },
      }
    end,
  },

  {
    'neovim/nvim-lspconfig',
    init = function()
      require('lspconfig.ui.windows').default_options.border =
        vim.g.border_chars
      vim.api.nvim_set_hl(0, 'LspInfoBorder', { link = 'FloatBorder' })
    end,
  },

  { import = 'plugins.extras.coding.emmet' },
  { import = 'plugins.extras.coding.tailwindcss' },
  { import = 'plugins.extras.formating.prettier' },
  { import = 'plugins.extras.formating.shfmt' },
  { import = 'plugins.extras.lang.astro' },
  { import = 'plugins.extras.lang.bash' },
  { import = 'plugins.extras.lang.css' },
  { import = 'plugins.extras.lang.graphql' },
  { import = 'plugins.extras.lang.html' },
  { import = 'plugins.extras.lang.liquid' },
  { import = 'plugins.extras.lang.lua' },
  { import = 'plugins.extras.lang.ruby' },
  { import = 'plugins.extras.lang.toml' },
  { import = 'plugins.extras.lang.vue' },
  { import = 'plugins.extras.lang.yaml' },
  { import = 'plugins.extras.linting.stylelint' },

  { import = 'lazyvim.plugins.extras.lang.typescript' },
  { import = 'lazyvim.plugins.extras.lang.json' },
  { import = 'lazyvim.plugins.extras.linting.eslint' },
}
