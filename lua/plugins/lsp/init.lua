require 'plugins/lsp/diagnostic'

local lsp_installer = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'
local lsp_util = require 'lspconfig.util'
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_buf_create_user_command

lsp_installer.setup {}

-- set border to lsp windows
autocmd('FileType', {
  pattern = { 'lspinfo', 'lsp-installer' },
  callback = function()
    vim.api.nvim_win_set_config(0, { border = vim.g.border })
  end,
})

lsp_util.default_config = vim.tbl_extend('force', lsp_util.default_config, {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    require('illuminate').on_attach(client)

    if vim.tbl_contains({ 'tsserver', 'jsonls', 'html', 'sumneko_lua' }, client.name) then
      client.resolved_capabilities.document_formatting = false
    end

    local opts = { buffer = true, noremap = true, silent = true }
    local function bmap(modes, keys, map)
      vim.keymap.set(modes, keys, map, opts)
    end

    -- rename
    bmap('n', '<F2>', vim.lsp.buf.rename)

    -- hover
    bmap('n', 'K', vim.lsp.buf.hover)
    bmap('n', '<C-k>', vim.lsp.buf.signature_help)

    -- code actions
    bmap('n', '<Leader>a', vim.lsp.buf.code_action)
    bmap('v', '<Leader>a', vim.lsp.buf.range_code_action)

    -- diagnostics
    bmap('n', '[d', vim.diagnostic.goto_prev)
    bmap('n', ']d', vim.diagnostic.goto_next)
    bmap('n', '[e', function() vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR } end)
    bmap('n', ']e', function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR } end)
    bmap('n', '<Leader>i', function() vim.diagnostic.open_float(0, { scope = 'line' }) end)
    bmap('n', '<Leader>d', function() require('trouble').toggle 'workspace_diagnostics' end)

    -- goto navigations
    bmap('n', 'gt', vim.lsp.buf.type_definition)
    bmap('n', 'gD', function() require('trouble').toggle 'lsp_definitions' end)
    bmap('n', 'gi', function() require('trouble').toggle 'lsp_implementations' end)
    bmap('n', 'gr', function() require('trouble').toggle 'lsp_references' end)

    -- format
    bmap('n', '<Leader><C-s>', ':noautocmd up<CR>')
    bmap('n', '<Leader>W', ':noautocmd up<CR>')
    bmap('n', '<Leader>f', vim.lsp.buf.formatting)
    bmap('v', '<Leader>f', vim.lsp.buf.range_formatting)

    command(0, 'Format', vim.lsp.buf.formatting, {})

    local exist, wk = pcall(require, 'which-key')
    if exist then
      wk.register {
        ['<Leader>'] = {
          a = 'Code action',
          d = 'Diagnostics',
          f = 'Format',
          i = 'Hover information',
          W = 'Save without format',
          ['<C-s>'] = 'Save without format',
        },
      }
      wk.register({
        ['<Leader>'] = {
          a = 'Format selection',
          f = 'Code action selection',
        },
      }, { mode = 'v' })
    end
  end,
})

-- config servers
local servers = {
  sumneko_lua = require('lua-dev').setup(),
  cssls = require 'plugins/lsp/languages/css',
  jsonls = require 'plugins/lsp/languages/json',
  gopls = require 'plugins/lsp/languages/go',
  emmet_ls = require 'plugins/lsp/languages/emmet',
  tsserver = require 'plugins/lsp/languages/typescript',
}

for server, config in pairs(servers) do
  lspconfig[server].setup(config)
end
