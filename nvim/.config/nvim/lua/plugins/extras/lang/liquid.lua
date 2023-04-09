local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.liquid = {
  install_info = {
    url = 'https://github.com/Shopify/tree-sitter-liquid.git',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'liquid',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'liquid' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        theme_check = {
          root_dir = function(fname)
            local util = require 'lspconfig.util'

            return util.root_pattern('.theme-check.yml', '.theme-check.yaml')(
              fname
            ) or util.find_package_json_ancestor
          end,
        },
      },
    },
  },
}
