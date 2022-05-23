local autocmd = vim.api.nvim_create_autocmd

-- [[ dressing (vim.ui) ]]
require('dressing').setup {
  input = {
    default_prompt = ' ',
    border = vim.g.border,
  },
  select = {
    backend = { 'telescope', 'builtin', 'nui' },
    telescope = require('telescope.themes').get_cursor(),
  },
}

autocmd('FileType', {
  pattern = 'DressingInput',
  callback = function()
    vim.b.copilot_enabled = false
  end,
})
