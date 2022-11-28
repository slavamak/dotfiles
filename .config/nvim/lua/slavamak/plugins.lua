local status, packer = pcall(require, 'packer')

if not status then
  print 'Packer is not installed'
  return
end

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager
  use 'nvim-lua/plenary.nvim' -- Lua functions for Neovim

  use 'kyazdani42/nvim-web-devicons' -- Adds file type icons
  use 'norcalli/nvim-colorizer.lua' -- A high-performance color highlighter
  use 'projekt0n/github-nvim-theme' -- Github color themes
  use 'nvim-lualine/lualine.nvim' -- Statusline

  use 'onsails/lspkind-nvim' -- Adds vscode-like pictograms
  use 'L3MON4D3/LuaSnip' -- A snippet engine
  use 'hrsh7th/nvim-cmp' -- A completion engine
  use 'hrsh7th/cmp-nvim-lsp' -- More types of completion candidates for LSP
  use 'hrsh7th/cmp-buffer' -- Source for buffer words
  use 'folke/lsp-colors.nvim' -- Creates missing LSP diagnostics highlight groups

  use 'williamboman/mason.nvim' -- Easily install and manage LSP
  use 'williamboman/mason-lspconfig.nvim' -- Extension that makes it easier to use lspconfig
  use 'neovim/nvim-lspconfig' -- Configurations for LSP

  use 'jayp0521/mason-null-ls.nvim' -- Extension that makes it easier to use null-ls
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics, code actions, formating
  use 'glepnir/lspsaga.nvim' -- A light-weight UI plugin for LSP

  use {
    'nvim-treesitter/nvim-treesitter',
    commit = '8e763332b7bf7b3a426fd8707b7f5aa85823a5ac',
    run = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
  } -- Syntax highlighting
  use 'nvim-treesitter/playground' -- Show treesitter and syntax highlight groups

  use 'nvim-telescope/telescope.nvim' -- Highly extendable fuzzy finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- File Browser extension

  use 'windwp/nvim-autopairs' -- Auto close brackets
  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter',
  } -- Auto close and auto rename html tags

  use 'lewis6991/gitsigns.nvim' -- Git decorations for buffers
  use 'dinhhuy258/git.nvim' -- Git wrapper
  use 'gpanders/editorconfig.nvim' -- Support for EditorConfig

  use 'rcarriga/nvim-notify' -- Notification manager
  use 'lukas-reineke/indent-blankline.nvim' -- Indentation guides to all lines
  use 'goolord/alpha-nvim' -- Programmable greeter

  if packer_bootstrap then packer.sync() end
end)
