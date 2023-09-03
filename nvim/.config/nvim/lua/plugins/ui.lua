return {
  {
    'xiyaowong/virtcolumn.nvim',
    event = 'BufReadPost',
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
    'folke/noice.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      version = false,
    },
    keys = {
      {
        '<leader>sna',
        require('telescope').extensions.noice.noice,
        desc = 'Noice All',
      },
    },
    opts = {
      cmdline = {
        format = {
          cmdline = { icon = '' },
          search_down = { icon = ' ' },
          search_up = { icon = ' ' },
          filter = { icon = '' },
          lua = { icon = '' },
          help = { icon = '' },
        },
      },
      commands = {
        history = {
          view = 'popup',
          opts = {
            size = {
              width = '80%',
              height = '80%',
            },
          },
        },
        last = {
          opts = {
            size = {
              width = '80%',
              height = '80%',
            },
          },
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      sections = {
        lualine_z = {
          function()
            return ' ' .. os.date ' %I:%M %p'
          end,
        },
      },
    },
  },

  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },

  {
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },
}
