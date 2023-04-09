return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
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
      },
    },
  },
}
