return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'lua', 'luadoc' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}
