local map = vim.keymap.set

-- classical save file
map('n', '<C-s>', ':update<CR>', { silent = true })
map('i', '<C-s>', '<C-o>:w<CR>', { silent = true })

-- exit from insert mode
map({ 'i', 'c' }, '<C-c>', '<Esc>', { silent = true })

-- paste without yanking
map('v', 'p', '"_dP', { silent = true })

-- clear higlight matches
map('n', '<C-h>', ':nohlsearch<CR>', { silent = true })

-- stay in visual mode on indent
map('v', '<', '<gv')
map('v', '>', '>gv')

-- not add single character to clipboard on delete
map('n', 'x', '"_x')
map('n', 'X', '"_X')

-- prev/next history command
map('c', '<M-k>', '<Up>')
map('c', '<M-j>', '<Down>')

-- px to em an viceversa
map('n', 'cr', require 'plugins/custom/px_to_rem')

-- code runner
map({ 'n', 'i' }, '<F5>', require 'plugins/custom/code_runner')
