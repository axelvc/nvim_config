local map = vim.keymap.set

require('Comment').setup {
  ignore = '^$',
  pre_hook = function()
    return require('ts_context_commentstring.internal').calculate_commentstring()
  end,
}

map('n', '<C-_>', 'gcc', { remap = true })
map('v', '<C-_>', 'gc', { remap = true })
