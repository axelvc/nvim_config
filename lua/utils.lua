-- easy inspect
function _G.put(...)
  for _, v in ipairs { ... } do
    print(vim.inspect(v))
  end
end

function _G.custom_fold()
  local filetype = vim.opt.filetype:get()
  local special_fold = {
    javascript = true,
    typescript = true,
    javascriptreact = true,
    typescriptreact = true,
    json = true,
  }

  local s, e = vim.v.foldstart, vim.v.foldend
  local s_line = vim.api.nvim_buf_get_lines(0, s - 1, s, true)[1]
  local e_line = vim.api.nvim_buf_get_lines(0, e - 1, e, true)[1]:gsub('^%s+', '')
  local size = e - s + 1

  if special_fold[filetype] then
    return ('%s        (%d)'):format(s_line, size)
  end

  return ('%s  %s      (%d)'):format(s_line, e_line, size)
end
