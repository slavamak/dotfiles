return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    config = function(_, opts)
      require('luasnip').config.set_config(opts)
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
}
