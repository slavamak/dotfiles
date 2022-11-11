local status, blankline = pcall(require, 'indent_blankline')
if not status then return end

blankline.setup {
  show_end_of_line = true,
  space_char_blankline = ' ',
}
