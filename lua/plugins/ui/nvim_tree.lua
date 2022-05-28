local nvim_tree = require 'nvim-tree'
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local g = vim.g

nvim_tree.setup {
  view = {
    width = 45,
    side = 'right',
    hide_root_folder = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = g.signs.hint,
      info = g.signs.info,
      warning = g.signs.warn,
      error = g.signs.error,
    },
  },
  renderer = {
    group_empty = true,
    add_trailing = false,
    highlight_opened_files = 'name',
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = true,
      git_placement = 'after',
      padding = ' ',
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          deleted = 'D',
          ignored = 'I',
          renamed = 'R',
          staged = 'A',
          unmerged = '',
          unstaged = 'M',
          untracked = 'U',
        },
      },
    },
  },
  git = {
    ignore = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  system_open = {
    cmd = 'wslview',
  },
  filters = {
    dotfiles = false,
    custom = { '.git' },
    exclude = {},
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

-- Close vim if the last buf is NvimTree
autocmd('BufEnter', {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match 'NvimTree_' ~= nil then
      vim.cmd 'quit'
    end
  end,
})
