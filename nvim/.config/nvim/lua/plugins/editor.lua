return {
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    init = function()
      local bind = require('util').bind()
      bind('n', '<Leader>u', '<Cmd>UndotreeToggle<Cr>', 'Undotree toggle')
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
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'

      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ['<Left>'] = actions.preview_scrolling_left,
              ['<Right>'] = actions.preview_scrolling_right,
            },
            n = {
              ['<Left>'] = actions.preview_scrolling_left,
              ['<Right>'] = actions.preview_scrolling_right,
            },
          },
        },
      }

      telescope.load_extension 'ui-select'
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeOpen', 'NvimTreeToggle', 'NvimTreeFindFileToggle' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      renderer = {
        icons = {
          show = {
            folder = false,
          },
        },
      },
    },
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
