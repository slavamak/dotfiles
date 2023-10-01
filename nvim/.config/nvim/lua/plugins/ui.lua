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
    config = function()
      vim.cmd 'colorscheme github_light'
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
