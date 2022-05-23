local exists, packer = pcall(require, 'packer')
local g = vim.g

if exists then
  require 'impatient'
  require 'packer_compiled'
else
  local packer_repo = 'https://github.com/wbthomason/packer.nvim'
  local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  os.execute('rm -rf ' .. packer_path)
  os.execute(('git clone --depth 1 %s %s'):format(packer_repo, packer_path))
  vim.cmd 'packadd packer.nvim'

  packer = require 'packer'
end

packer.startup {
  require 'plugins/list',
  config = {
    compile_path = vim.fn.stdpath 'config' .. '/lua/packer_compiled.lua',
    profile = {
      enable = false,
    },
    display = {
      prompt_border = g.border,
      open_fn = function()
        return require('packer.util').float {
          border = g.border,
        }
      end,
    },
  },
}

if not exists then
  packer.sync()
end

-- packer shortcuts of shortcuts
local command = vim.api.nvim_create_user_command

command('PS', 'PackerSync', {})
command('PI', 'PackerInstall', {})
command('PC', 'PackerClean', {})
