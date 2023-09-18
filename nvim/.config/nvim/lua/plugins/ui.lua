return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = 'NONE',
        functions = 'NONE',
        keywords = 'NONE',
        variables = 'NONE',
      },
    },
    config = function(_, opts)
      require('github-theme').setup(opts)

      vim.cmd 'colorscheme github_light'
    end,
  },

  {
    'xiyaowong/virtcolumn.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
  },
}
