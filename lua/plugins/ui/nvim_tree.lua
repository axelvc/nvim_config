local nvim_tree = require 'nvim-tree'
local map = vim.keymap.set
local g = vim.g

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_refresh_wait = 100
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
  default = '',
  git = {
    deleted = 'D',
    ignored = 'I',
    renamed = 'R',
    staged = 'A',
    unmerged = '',
    unstaged = 'M',
    untracked = 'U',
  },
}

nvim_tree.setup {
  disable_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_reload_on_write = true,
  open_on_tab = false,
  update_cwd = false,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = g.signs.hint,
      info = g.signs.info,
      warning = g.signs.warn,
      error = g.signs.error,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = { '.git' },
  },
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    width = 45,
    hide_root_folder = true,
    side = 'right',
    mappings = {
      custom_only = false,
      list = {
        { key = '?', cb = ':WhichKey<CR>' },
      },
    },
  },
  actions = {
    change_dir = {
      enable = false,
    },
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = true,
      },
    },
  },
}

map('n', '<C-n>', function()
  nvim_tree.toggle(true)
end)
