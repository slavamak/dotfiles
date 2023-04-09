return {
  'nvim-treesitter/nvim-treesitter',
  opts = function(_, opts)
    opts.ignore_install = { 'help' }

    vim.list_extend(opts.ensure_installed, {
      'dockerfile',
      'git_config',
      'jsdoc',
      'make',
      'toml',
      'vimdoc',
    })
  end,
}
