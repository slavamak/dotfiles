return {
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    init = function()
      local bind = require('util').bind()
      bind('n', '<leader>u', '<cmd>UndotreeToggle<cr>', 'Undotree toggle')
    end,
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = function()
      local actions = require 'telescope.actions'

      return {
        defaults = {
          mappings = {
            i = {
              ['<Down>'] = actions.preview_scrolling_left,
              ['<Up>'] = actions.preview_scrolling_right,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
            n = {
              ['<Down>'] = actions.preview_scrolling_left,
              ['<Up>'] = actions.preview_scrolling_right,
            },
          },
        },
      }
    end,
  },

  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },

  {
    'kylechui/nvim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
}
