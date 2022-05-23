local hop = require 'hop'
local map = vim.keymap.set

hop.setup {}

map('n', 'gs', hop.hint_words)
map('n', 'g/', hop.hint_char1)
