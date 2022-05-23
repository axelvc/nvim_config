local g = vim.g

for sign, icon in pairs(g.signs) do
  local hl = 'DiagnosticSign' .. sign:gsub('^%l', string.upper)

  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = g.border,
  max_height = 35,
})

vim.diagnostic.config {
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = false,
  float = {
    source = false,
    border = g.border,
    format = function(diagnostic)
      if diagnostic.source == 'typescript' then
        diagnostic.source = 'ts'
      end

      return ('[%s] %s (%s)'):format(diagnostic.source, diagnostic.message, diagnostic.col)
    end,
  },
}
