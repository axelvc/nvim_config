local function code_runner()
  local extensions = {
    lua = 'luajit',
    rust = 'cargo run',
    typescript = 'esno',
    javascript = 'node',
    python = 'python3',
    go = 'go run',
  }

  local path = vim.api.nvim_buf_get_name(0)
  local filetype = vim.opt.filetype:get()
  local runner = extensions[filetype]

  if runner then
    vim.cmd(('update | vnew | terminal %s %s'):format(runner, path))
  else
    vim.api.nvim_echo({ { 'Runner not implemented', 'Error' } }, true, {})
  end
end

return code_runner
