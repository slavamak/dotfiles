local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then return end

treesitter.setup {
  auto_install = true,
  ensure_installed = {
    'astro',
    'bash',
    'css',
    'graphql',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'make',
    'markdown',
    'scss',
    'tsx',
    'typescript',
    'yaml',
  },
  highlight = {
    enable = true,
    disable = {},
    -- Disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 500 * 1024 -- 500 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then return true end
    end,
  },
  indent = {
    enable = true,
    disable = {},
  },
  playground = {
    enable = true,
    disable = {},
  },
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.liquid = {
  install_info = {
    url = 'https://github.com/Shopify/tree-sitter-liquid-ii.git',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'liquid',
}
