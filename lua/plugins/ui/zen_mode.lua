local zen_mode = require 'zen-mode'
local map = vim.keymap.set

zen_mode.setup {
  window = {
    backdrop = 1,
    width = 100,
    height = 0.9,
    options = {
      number = true,
      relativenumber = true,
    },
  },
}

map('n', '<Leader>z', zen_mode.toggle)

local exist, wk = pcall(require, 'which-key')
if exist then
  wk.register { ['<Leader>z'] = 'Zen mode' }
end
