return {
  {
    'xiyaowong/virtcolumn.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      filetypes = { '*', '!lazy' },
      buftype = { '*', '!prompt', '!nofile' },
      user_default_options = {
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      },
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      sections = {
        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
          },
        },
      },
    },
  },
}
