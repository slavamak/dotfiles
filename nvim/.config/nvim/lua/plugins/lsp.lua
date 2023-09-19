return {
  {
    'folke/neodev.nvim',
    config = true,
    dependencies = {
      { 'folke/neoconf.nvim', config = true },
    },
  },

  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    cmd = { 'Mason' },
    opts = {
      ui = {
        border = vim.g.border_chars,
      },
    },
    config = true,
  },

  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'folke/neodev.nvim' },
      { 'b0o/schemastore.nvim' },
    },
    opts = {
      servers = {
        astro = {},
        bashls = {
          filetypes = { 'sh', 'bash', 'zsh' },
        },
        cssls = {},
        emmet_ls = {},
        graphql = {},
        html = {},
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = true,
              },
            },
          },
        },
        ruby_ls = {},
        stylelint_lsp = {
          filetypes = {
            'css',
            'less',
            'scss',
          },
          settings = {
            stylelintplus = {
              autoFixOnFormat = true,
            },
          },
        },
        taplo = {},
        theme_check = {
          root_dir = function(fname)
            local util = require 'lspconfig.util'
            return util.root_pattern('.theme-check.yml', '.theme-check.yaml')(fname)
              or util.find_package_json_ancestor
          end,
        },
        vuels = {},
        yamlls = {
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require('schemastore').yaml.schemas())
          end,
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              validate = { enable = true },
              completion = true,
              hover = true,
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps {
          buffer = bufnr,
          exclude = { '<F2>', '<F3>', '<F4>' },
          preserve_mappings = false,
        }

        local bind = require('util').bind { buffer = bufnr }

        bind('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
        bind('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
        bind('n', '<leader>f', vim.lsp.buf.format, 'Format code')
      end)

      local handlers = { lsp_zero.default_setup }
      local ensure_installed = {}

      for server, server_opts in pairs(opts.servers) do
        server_opts = server_opts == true and {} or server_opts
        if server_opts then
          handlers[server] = function()
            require('lspconfig')[server].setup(server_opts)
          end
        end
        table.insert(ensure_installed, server)
      end

      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        handlers = handlers,
      }
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'b0o/schemastore.nvim' },
    },
    config = function()
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_cmp()

      local cmp = require 'cmp'
      local cmp_action = lsp_zero.cmp_action()

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        sources = {
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'path' },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        },
      }
    end,
  },
}
