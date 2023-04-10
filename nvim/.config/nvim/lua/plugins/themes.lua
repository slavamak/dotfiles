return {
  {
    'projekt0n/github-nvim-theme',
    tag = 'v0.0.7',
    lazy = false,
    priority = 1000,
    opts = {
      theme_style = 'light',
      comment_style = 'NONE',
      keyword_style = 'NONE',
      function_style = 'NONE',
      variable_style = 'NONE',
    },
    config = function(_, opts)
      require('github-theme').setup(opts)
    end,
  },
}
