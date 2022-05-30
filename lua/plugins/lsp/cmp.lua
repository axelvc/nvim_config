local cmp = require 'cmp'
local luasnip = require 'luasnip'
local g = vim.g

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

-- load snippets
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.filetype_extend('typescript', { 'javascript' })
luasnip.filetype_extend('typescriptreact', { 'javascriptreact' })

luasnip.config.setup {
  region_check_events = 'CursorHold',
}

-- diable github copilot mapping
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

cmp.setup {
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
  window = {
    completion = cmp.config.window.bordered {
      border = g.border,
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,IncSearch:Visual,Search:None',
    },
    documentation = cmp.config.window.bordered {
      border = g.border,
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,IncSearch:Visual,Search:None',
    },
  },
  enabled = function()
    -- disable in comments
    local context = require 'cmp.config.context'

    if context.in_treesitter_capture 'comment' or context.in_syntax_group 'Comment' then
      return false
    end

    --- disable in snippets
    if luasnip.jumpable() then
      return false
    end

    return true
  end,
  completion = {
    completeopt = 'menu,menuone,noselect,noinsert',
  },
  formatting = {
    format = require('lspkind').cmp_format {
      mode = 'symbol',
      symbol_map = {
        Text = '  ',
        Method = '  ',
        Function = '  ',
        Constructor = '  ',
        Field = '  ',
        Variable = '[]',
        Class = ' פּ ',
        Interface = ' 蘒 ',
        Module = '  ',
        Property = '  ',
        Unit = ' 塞 ',
        Value = '  ',
        Enum = ' 練 ',
        Keyword = '  ',
        Snippet = '  ',
        Color = '  ',
        File = '  ',
        Reference = '  ',
        Folder = '  ',
        EnumMember = ' 練 ',
        Constant = '  ',
        Struct = '  ',
        Event = '  ',
        Operator = '  ',
        TypeParameter = '<>',
      },
    },
    fields = { 'kind', 'menu', 'abbr' },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    -- open suggestions
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(nil), { 'i', 'c' }),
    -- close suggetions
    ['<C-q>'] = cmp.mapping {
      i = function()
        cmp.abort()
        vim.fn['copilot#Dismiss']()
      end,
      c = cmp.mapping.close(),
    },
    -- confirm suggestion
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm { select = true }
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- copilot
    ['<C-l>'] = cmp.mapping(function(fallback)
      if vim.b._copilot ~= nil and vim.b._copilot.suggestions ~= nil then
        vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](), 't', false)
      else
        fallback()
      end
    end),
    -- scroll
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- select suggestion
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
  },
}
