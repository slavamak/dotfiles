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

  {
    'nvim-lualine/lualine.nvim',
    opts = function(_, opts)
      local icons = require('lazyvim.config').icons
      local chevron_right = ' ' .. icons.ui.chevron_right .. ' '

      opts.options = {
        theme = 'auto',
        globalstatus = true,
        disabled_filetypes = {
          statusline = { 'alpha' },
          winbar = { 'neo-tree', 'alpha' },
        },
      }

      opts.sections.lualine_c = {
        {
          'diagnostics',
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      }

      opts.sections.lualine_x = vim.list_extend(opts.sections.lualine_x, {
        {
          'filetype',
          icons_enabled = false,
        },
      })

      opts.winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            separator = '',
            padding = { left = 1, right = 0 },
            fmt = function(path)
              return vim.fs.dirname(path):gsub('/', chevron_right)
                .. chevron_right
            end,
          },
          {
            'filetype',
            icon_only = true,
            separator = '',
            padding = { left = 0, right = 1 },
          },
          {
            'filename',
            path = 0,
            separator = icons.ui.chevron_right,
            padding = { left = 0, right = 1 },
            symbols = { modified = '  ', readonly = '', unnamed = '' },
          },
          {
            function()
              return require('nvim-navic').get_location()
            end,
            cond = function()
              return package.loaded['nvim-navic']
                and require('nvim-navic').is_available()
            end,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }

      opts.inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    end,
  },
}
