local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local map = vim.keymap.set

---@param name string
---@return table<string>
local function get_borders(name)
  local border_chars = {
    double = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
    rounded = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    shadow = { '█', '█', '█', '█', '█', '█', '█', '█' },
    single = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    solid = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
  }

  return border_chars[name]
end

telescope.setup {
  defaults = {
    layout_config = {
      horizontal = {
        width = 0.9,
        height = 0.9,
      },
    },
    borderchars = get_borders(vim.g.border),
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-.',
      '-g',
      '!{yarn.lock,package-lock.jsonk,node_modules}',
    },
    file_ignore_patterns = { '%.git/', 'node_modules' },
    selection_caret = ' ',
    prompt_prefix = ' ',
    mappings = {
      i = {
        ['<C-q>'] = actions.close,
        ['<C-s>'] = actions.select_vertical,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-b>'] = actions.preview_scrolling_up,
      },
      n = {
        ['q'] = actions.close,
        ['<C-q>'] = actions.close,
        ['<C-c>'] = actions.close,
        ['<C-s>'] = actions.select_vertical,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-b>'] = actions.preview_scrolling_up,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      strategy = 'center',
    },
  },
}

telescope.load_extension 'fzf'
telescope.load_extension 'fzy_native'

map('n', '<C-p>', telescope_builtin.find_files)
map('n', '<Leader>/', telescope_builtin.live_grep)
map('n', '<Leader><Leader>', ':Telescope<CR>', { silent = true })
map('n', '<leader>gB', telescope_builtin.git_branches)
map('n', '<leader>gs', telescope_builtin.git_status)

local exists, wk = pcall(require, 'which-key')
if exists then
  wk.register {
    ['<Leader>'] = {
      ['/'] = 'Stage hunk',
      g = {
        B = 'Branches',
        s = 'Status',
      },
    },
  }
end
