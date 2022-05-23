local _, tsserver = require('nvim-lsp-installer').get_server 'tsserver'

tsserver._installer = require('nvim-lsp-installer.core.managers.npm').packages {
  'typescript',
  'typescript-language-server',
  'typescript-styled-plugin', -- add styled component detection
}

return {
  root_dir = function()
    return require('lspconfig').util.root_pattern(
      '.git',
      'package.json',
      'tsconfig.json',
      'jsconfig.json',
      'node_modules'
    )() or vim.loop.cwd()
  end,
  init_options = {
    plugins = {
      {
        name = 'typescript-styled-plugin',
        location = tsserver.root_dir .. '/node_modules/typescript-styled-plugin',
      },
    },
  },
}
