local trailspace = require 'mini.trailspace'
local command = vim.api.nvim_create_user_command
local hl = vim.api.nvim_set_hl

trailspace.setup {}

command('Whitespace', trailspace.trim, {})
hl(0, 'MiniTrailspace', { bg = '#f7768e' })
