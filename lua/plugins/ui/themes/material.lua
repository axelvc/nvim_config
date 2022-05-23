local material = require 'material'

vim.g.material_style = 'deep ocean'

material.setup {
  contrast = {
    sidebars = true,
    floating_windows = true,
    line_numbers = false,
    sign_column = false,
    cursor_line = true,
    non_current_windows = false,
    popup_menu = true,
  },
  popup_menu = 'dark',
  italics = {
    functions = true,
    variables = true,
    comments = true,
    keywords = true,
    strings = true,
  },
  contrast_windows = {
    'packer',
    'terminal',
    'toggleterm',
  },
  text_contrast = {
    lighter = true,
    darker = true,
  },
  disable = {
    borders = false,
    background = false,
    term_colors = false,
    eob_lines = false,
  },
}

vim.cmd 'colorscheme material'
