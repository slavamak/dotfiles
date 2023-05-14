return {
  {
    'LazyVim/LazyVim',
    opts = {
      icons = {
        ui = {
          chevron_right = '',
          chevron_down = '',
        },
      },
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = function(_, opts)
      local icons = require('lazyvim.config').icons

      opts.window.mappings = vim.tbl_extend('force', opts.window.mappings, {
        ['Z'] = 'expand_all_nodes',
      })

      opts.default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = icons.ui.chevron_right,
          expander_expanded = icons.ui.chevron_down,
          expander_highlight = 'NeoTreeExpander',
        },
      }
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    opts = function(_, opts)
      local icons = require('lazyvim.config').icons

      opts.defaults.prompt_prefix = icons.ui.chevron_right .. ' '
      opts.defaults.selection_caret = icons.ui.chevron_right .. ' '
    end,
  },
}
