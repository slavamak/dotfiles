local status, telescope = pcall(require, 'telescope')
if not status then return end
local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'

local function telescope_buffer_dir()
  return vim.fn.expand '%:p:h'
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-s>'] = actions.delete_buffer,
        ['<C-q>'] = actions.close,
      },
      n = {
        ['<C-s>'] = actions.delete_buffer,
        ['q'] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      path = '%:p:h',
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = 'normal',
      hijack_netrw = true,
    },
  },
  layout_config = { height = 0.75 },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
}

telescope.load_extension 'file_browser'
telescope.load_extension 'notify'

local keymap = vim.keymap

keymap.set('n', '<leader>ff', builtin.find_files)
keymap.set('n', '<leader>fg', builtin.live_grep)
keymap.set('n', '<leader>fb', builtin.buffers)
keymap.set('n', '<leader>fh', builtin.help_tags)
keymap.set('n', '<leader>fo', builtin.oldfiles)
keymap.set('n', '<leader>fB', telescope.extensions.file_browser.file_browser)
