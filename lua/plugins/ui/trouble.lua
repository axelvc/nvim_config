require('trouble').setup {
  action_keys = {
    previous = { 'k', '<C-k>' },
    next = { 'j', '<C-j>' },
  },
  fold_open = '',
  fold_closed = '',
  padding = false,
  auto_close = true,
  use_diagnostic_signs = true,
}
