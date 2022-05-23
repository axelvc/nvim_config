vim.g.tokyonight_style = 'night'
vim.g.tokyonight_terminal_colors = false
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_sidebars = {
  'packer',
  'terminal',
  'toggleterm',
}

require('tokyonight').colorscheme()
