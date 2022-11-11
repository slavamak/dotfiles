local status, github_theme = pcall(require, 'github-theme')
if not status then return end

vim.o.background = 'light'

github_theme.setup {
  comment_style = 'NONE',
  keyword_style = 'NONE',
  function_style = 'NONE',
  variable_style = 'NONE',
  theme_style = 'light_default',

  overrides = function(c)
    return {
      htmlArg = { fg = c.magenta },
      TSOperator = { fg = c.syntax.string },
    }
  end,
}
