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
          'TelescopePrompt',
        },
      },
      winbar = {
        lualine_a = { { '%f', padding = 0 } },
      },
      inactive_winbar = {
        lualine_a = { { '%f', padding = 0 } },
      },
      sections = {
        lualine_a = {
          {
            '',
            type = 'stl',
            padding = { left = 0, right = 2 },
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
        lualine_y = { { 'progress', padding = { left = 1, right = 0 } } },
        lualine_z = { { 'location', padding = { left = 1, right = 0 } } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', padding = 0 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
    },
    config = function(_, opts)
      require('modules.lualine').setup(opts)
    end,
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
