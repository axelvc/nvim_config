---@diagnostic disable: missing-parameter
local Terminal = require('toggleterm.terminal').Terminal
local map = vim.keymap.set

require('toggleterm').setup {
  direction = 'float',
  open_mapping = '<C-Bslash>',
  shell = '/usr/bin/zsh',
  size = 15,
}

-- lazygit
local lazygit = Terminal:new {
  cmd = 'lazygit',
  hidden = true,
}

map('n', '<Leader>gg', function()
  lazygit:toggle()
end)

-- glow (markdown in terminal)
local glow = Terminal:new {
  cmd = 'glow',
  hidden = true,
}

map('n', '<Leader>m', function()
  glow:toggle()
end)

local exist, wk = pcall(require, 'which-key')
if exist then
  wk.register {
    ['<Leader>gg'] = 'Lazygit',
    ['<Leader>m'] = 'Markdown preview',
  }
end
