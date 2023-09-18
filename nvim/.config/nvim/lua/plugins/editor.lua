return {
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    init = function()
      local bind = require('util').bind()
      bind('n', '<leader>u', '<cmd>UndotreeToggle<cr>', 'Undotree Toggle')
    end,
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      local bind = require('util').bind()

      bind('n', '<leader>ff', '<cmd>Telescope find_files<cr>', 'Find Files')
      bind('n', '<leader>fg', '<cmd>Telescope git_files<cr>', 'Git Search')
      bind('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', 'Recently Opened')
      bind('n', '<leader>fb', '<cmd>Telescope buffers<cr>', 'Buffer List')
      bind('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', 'Help Tags')
      bind({ 'n', 'v' }, '<leader>fs', '<cmd>Telescope grep_string<cr>', 'String Search')
      bind('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', 'Keymaps List')
    end,
  },
}
