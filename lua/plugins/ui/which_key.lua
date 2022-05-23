local wk = require 'which-key'

wk.setup {
  registers = true,
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<Plug>', '<CR>', 'call', 'lua', '^:', '^ ', '%(%)' },
  icons = {
    breadcrumb = '»',
    separator = '➜',
    group = '+',
  },
}
