return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
      highlight_groups = {
        Lualine = { fg = 'muted', bg = 'base' },
        LualineNC = { fg = 'highlight_med', bg = 'base' },
        NonText = { fg = 'highlight_med' },
        VirtColumn = { fg = 'highlight_low' },
      },
    },
    config = function(_, opts)
      require('rose-pine').setup(opts)
      vim.cmd 'colorscheme rose-pine'
    end,
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
        globalstatus = true,
      },
      tabline = {
        lualine_a = {
          {
            'tabs',
            mode = 1,
            fmt = function(name, context)
              local buflist = vim.fn.tabpagebuflist(context.tabnr)
              local winnr = vim.fn.tabpagewinnr(context.tabnr)
              local bufnr = buflist[winnr]
              local filetype = vim.bo[bufnr].filetype
              local tab_name = name

              if filetype == 'netrw' then
                tab_name = 'File Tree'
              elseif filetype == 'TelescopePrompt' then
                tab_name = 'Telescope'
              end

              return tab_name
            end,
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            '',
            type = 'stl',
            on_click = function()
              vim.cmd 'tabclose'
            end,
          },
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
          'b:gitsigns_head',
          {
            'diff',
            colored = false,
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
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
    config = true,
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
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        highlight = 'VirtColumn',
      },
      scope = {
        show_start = false,
      },
    },
  },
}
