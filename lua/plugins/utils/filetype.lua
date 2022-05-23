require('filetype').setup {
  overrides = {
    literal = {
      ['.czrc'] = 'json',
      ['.zimrc'] = 'zsh',
    },
    complex = {
      ['[jt]sconfig.json'] = 'jsonc',
      ['%.env%..*'] = 'sh',
    },
  },
}
