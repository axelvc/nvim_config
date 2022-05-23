local notify = require 'notify'

notify.setup {
  stages = 'fade',
  on_open = nil,
  timeout = 3000,
  background_colour = 'NormalFloat',
  icons = {
    ERROR = ' ',
    WARN = ' ',
    INFO = ' ',
    DEBUG = ' ',
    TRACE = ' ',
  },
}

vim.notify = notify
