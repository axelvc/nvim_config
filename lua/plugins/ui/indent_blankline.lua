require('indent_blankline').setup {
  show_end_of_file = true,
  use_treesitter = true,
  filetype_exclude = {
    'help',
    'packer',
    'terminal',
    'toggleterm',
    'NvimTree',
  },
  buftype_exclude = {
    'help',
    'nofile',
    'prompt',
  },
}
