local status, alpha = pcall(require, 'alpha')
if not status then return end

local header = {
  type = 'text',
  val = {
    [[                                     ]],
    [[      __                _            ]],
    [[   /\ \ \___  ___/\   /(_)_ __ ___   ]],
    [[  /  \/ / _ \/ _ \ \ / | | '_ ` _ \  ]],
    [[ / /\  |  __| (_) \ V /| | | | | | | ]],
    [[ \_\ \/ \___|\___/ \_/ |_|_| |_| |_| ]],
    [[                                     ]],
  },
  opts = {
    position = 'center',
    hl = 'Comment',
  },
}

local function getGreeting(name)
  local tableTime = os.date '*t'
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = '  Sleep well',
    [2] = '  Good morning',
    [3] = '  Good afternoon',
    [4] = '  Good evening',
    [5] = '望 Good night',
  }
  local greetingIndex = 0
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end
  return greetingsTable[greetingIndex] .. ', ' .. name .. '!'
end

local greetHeading = {
  type = 'text',
  val = getGreeting 'Slava',
  opts = {
    position = 'center',
    hl = 'String',
  },
}

local pluginCount = {
  type = 'text',
  val = string.format('  Loaded %d plugins', vim.tbl_count(packer_plugins)),
  opts = {
    position = 'center',
    hl = 'Comment',
  },
}

local function getVersion()
  local version = vim.version()
  local nvim_version_info = 'v'
    .. version.major
    .. '.'
    .. version.minor
    .. '.'
    .. version.patch

  return '  ' .. nvim_version_info
end

local footer = {
  type = 'text',
  val = getVersion(),
  opts = {
    position = 'center',
    hl = 'Comment',
  },
}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub('%s', ''):gsub('SPC', '<leader>')

  local opts = {
    position = 'center',
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 20,
    align_shortcut = 'right',
    hl_shortcut = 'Identifier',
    hl = 'Constant',
  }

  if keybind then
    opts.keymap = { 'n', sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = 'button',
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, 'normal', false)
    end,
    opts = opts,
  }
end

local buttons = {
  type = 'group',
  val = {
    button('E', '   New file', '<cmd>ene<CR>'),
    button('B', '   File browser', ':Telescope file_browser<CR>'),
    button('O', '   Recents', ':Telescope oldfiles<CR>'),
    button('q', '   Quit', ':qa!<CR>'),
  },
  opts = {
    position = 'center',
    spacing = 1,
  },
}

local section = {
  header = header,
  buttons = buttons,
  greetHeading = greetHeading,
  pluginCount = pluginCount,
  footer = footer,
}

local opts = {
  layout = {
    { type = 'padding', val = 3 },
    section.header,
    { type = 'padding', val = 3 },
    section.greetHeading,
    { type = 'padding', val = 2 },
    section.buttons,
    { type = 'padding', val = 2 },
    section.pluginCount,
    section.footer,
  },
  opts = {
    margin = 30,
  },
}

alpha.setup(opts)
