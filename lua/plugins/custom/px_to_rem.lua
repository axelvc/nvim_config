local function px_to_rem()
  local REM = 16
  local REGEX = '(%d*%.?%d+)'
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local word = vim.fn.expand('<cWORD>', nil, nil)
  local rem_val = word:match(REGEX .. 'rem')
  local px_val = word:match(REGEX .. 'px')

  if rem_val then
    local new_val = string.gsub(word, REGEX .. 'rem', rem_val * REM .. 'px')

    vim.cmd('silent normal! ciW' .. new_val)
    vim.fn.cursor(row, col + 1)
  end

  if px_val then
    local new_val = string.gsub(word, REGEX .. 'px', px_val / REM .. 'rem')

    vim.cmd('silent normal! ciW' .. new_val)
    vim.fn.cursor(row, col + 1)
  end
end

return px_to_rem
