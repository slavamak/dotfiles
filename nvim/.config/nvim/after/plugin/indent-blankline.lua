local status, blankline = pcall(require, 'indent_blankline')
if not status then return end

blankline.setup {
  show_end_of_line = true,
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
}
