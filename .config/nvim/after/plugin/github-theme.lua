local status, github_theme = pcall(require, 'github-theme')
if not status then return end

vim.o.background = 'light'

github_theme.setup {
  comment_style = 'NONE',
  keyword_style = 'NONE',
  function_style = 'NONE',
  variable_style = 'NONE',
  theme_style = 'light',
  dark_float = true,
  dark_sidebar = true,
  colors = {
    bg_highlight = '#f6f8fa',
    line_nr = '#babbbc',
  },
  dev = true,
  overrides = function(c)
    return {
      htmlArg = { fg = c.syntax.func },
      htmlTitle = { fg = c.fg, style = 'NONE' },
      htmlSpecialChar = { fg = c.syntax.func },
      htmlSpecialTagName = { fg = c.syntax.tag },
      javaScript = { fg = c.fg },
      javaScriptBraces = { link = 'javaScript' },
      javaScriptGlobal = { fg = c.syntax.constant },
      javaScriptMember = { fg = c.syntax.constant },
      liquidExpression = { fg = c.syntax.constant },
      liquidDelimiter = { fg = c.fg },
      liquidQuote = { link = 'liquidString' },
      liquidKeyword = { fg = c.syntax.tag },

      LspInfoBorder = { link = 'TelescopeBorder' },
      LspSagaHoverBorder = { fg = c.fg_gutter },
      LspSagaCodeActionBorder = { link = 'LspSagaHoverBorder' },
      NullLsInfoBorder = { link = 'TelescopeBorder' },

      VirtColumn = { fg = c.bg_visual },
    }
  end,
}
