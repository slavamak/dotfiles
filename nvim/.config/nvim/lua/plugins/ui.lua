return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {
      groups = {
        all = {
          Lualine = { fg = 'fg0', bg = 'bg1' },
          LualineNC = { fg = 'palette.fg.muted', bg = 'bg1' },
        },
      },
    },
    config = function(_, opts)
      require('github-theme').setup(opts)
      vim.cmd 'colorscheme github_light'
    end,
  },

  {
    'folke/tokyonight.nvim',
    opts = {
      style = 'night',
      light_style = 'day',
      on_highlights = function(hl, c)
        hl.Lualine = {
          bg = c.bg,
          fg = c.dark5,
        }
        hl.LualineNC = {
          bg = c.bg,
          fg = c.fg_gutter,
        }
      end,
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'InsertEnter' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'NvimTree',
        },
      },
      winbar = {
        lualine_a = { '%f' },
      },
      inactive_winbar = {
        lualine_a = { '%f' },
      },
      sections = {
        lualine_a = {
          {
            '',
            type = 'stl',
            padding = { left = 1, right = 2 },
            on_click = function()
              vim.cmd 'edit $DOTFILES/nvim/.config/nvim/lua/config/options.lua'
            end,
          },
        },
        lualine_b = {
          'branch',
          { 'diff', colored = false },
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn' },
            diagnostics_color = {
              error = 'DiagnosticError',
              warn = 'DiagnosticWarn',
              info = 'DiagnosticInfo',
              hint = 'DiagnosticHint',
            },
            symbols = {
              error = ' ',
              warn = ' ',
              info = 'I',
              hint = 'H',
            },
            colored = false,
            update_in_insert = true,
            always_visible = false,
          },
        },
        lualine_c = { 'filename' },
        lualine_x = { { 'filetype', icons_enabled = false } },
        lualine_y = { { 'progress' } },
        lualine_z = { { 'location' } },
      },
    },
    config = function(_, opts)
      require('modules.lualine').setup(opts)
    end,
  },

  {
    'f-person/auto-dark-mode.nvim',
    event = 'VeryLazy',
    opts = {
      update_interval = 500,
      set_dark_mode = function()
        vim.cmd 'colorscheme tokyonight'
        vim.api.nvim_set_option('background', 'dark')
      end,
      set_light_mode = function()
        vim.cmd 'colorscheme github_light'
        vim.api.nvim_set_option('background', 'light')
      end,
    },
  },

  {
    'jovanlanik/fsplash.nvim',
    opts = {
      autocmds = {
        'ModeChanged',
        'CursorMoved',
        'TextChanged',
        -- 'VimResized',
        -- 'WinScrolled',
      },
      border = 'none',
    },
  },

  {
    'lukas-reineke/virt-column.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      highlight = 'VirtColumn',
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      show_current_context = true,
    },
  },
}
