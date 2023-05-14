return {
  'nvim-treesitter/nvim-treesitter',
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      'dockerfile',
      'git_config',
      'jsdoc',
      'make',
      'toml',
    })
  end,
}
