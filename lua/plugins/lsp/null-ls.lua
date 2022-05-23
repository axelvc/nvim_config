local null_ls = require 'null-ls'
local autocmd = vim.api.nvim_create_autocmd
local prettier_config = require 'plugins/lsp/languages/prettier'
local eslint_config = require 'plugins/lsp/languages/eslint'

local function format_on_save()
  local filetype = vim.opt.filetype:get()
  local format_list = {
    markdown = true,
    javascript = true,
    typescript = true,
    javascriptreact = true,
    typescriptreact = true,
    json = true,
    jsonc = true,
    markown = true,
    css = true,
    html = true,
    python = true,
    go = true,
  }

  if format_list[filetype] then
    vim.lsp.buf.formatting_sync({ save = true }, 2000)
  end
end

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.eslint_d.with(eslint_config),
    null_ls.builtins.diagnostics.eslint_d.with(eslint_config),
    null_ls.builtins.formatting.eslint_d.with(eslint_config),
    null_ls.builtins.formatting.prettierd.with(prettier_config),
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      autocmd('BufWritePre', {
        buffer = 0,
        callback = format_on_save,
      })
    end
  end,
}
