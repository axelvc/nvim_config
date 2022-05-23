return function(use)
  -- [[ Chore ]] --------------------------------------------------------------------
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim' -- improve speed
  use 'dstein64/vim-startuptime' -- mesure startup-time
  use 'nvim-lua/plenary.nvim' -- utility functions used by lots of plugins

  -- [[ UI ]] -----------------------------------------------------------------------
  -- use { 'projekt0n/github-nvim-theme', config = function() require 'plugins/ui/themes/github' end,     as = 'theme' }
  -- use { 'marko-cerovac/material.nvim', config = function() require 'plugins/ui/themes/material' end,   as = 'theme' }
  -- use { 'folke/tokyonight.nvim',       config = function() require 'plugins/ui/themes/tokyonight' end, as = 'theme' }
  use { 'catppuccin/nvim',             config = function() require 'plugins/ui/themes/catppuccin' end, as = 'theme' }

  use { -- finder like fzf
    'nvim-telescope/telescope.nvim',
    config = function() require 'plugins/ui/telescope' end,
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
  }

  use { -- treesitter
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'plugins/ui/treesitter' end,
    run = ':TSUpdate',
    as = 'ts',
  }
  use { 'p00f/nvim-ts-rainbow',                        after = 'ts' } -- rainbow colors
  use { 'windwp/nvim-ts-autotag',                      after = 'ts' } -- auto close tag
  use { 'nvim-treesitter/playground',                  after = 'ts' } -- playground
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'ts' } -- commentstring based on location

  -- git
  use { 'lewis6991/gitsigns.nvim', config = function() require 'plugins/ui/gitsigns' end } -- git signs

  -- bars
  use { 'akinsho/nvim-bufferline.lua', config = function() require 'plugins/ui/bufferline' end }               -- tabline
  use { 'hoob3rt/lualine.nvim',        config = function() require 'plugins/ui/lualine' end, after = 'theme' } -- statusline

  -- extra
  use { 'folke/trouble.nvim',                  config = function() require 'plugins/ui/trouble' end }          -- pretty diagnostics
  use { 'rcarriga/nvim-notify',                config = function() require 'plugins/ui/.notify' end }          -- fancy notifications
  use { 'folke/zen-mode.nvim',                 config = function() require 'plugins/ui/.zen_mode' end }        -- zen mode
  use { 'kyazdani42/nvim-tree.lua',            config = function() require 'plugins/ui/nvim_tree' end }        -- sidebar explorer
  use { 'norcalli/nvim-colorizer.lua',         config = function() require 'plugins/ui/colorizer' end }        -- color highlighter
  use { 'folke/which-key.nvim',                config = function() require 'plugins/ui/which_key' end }        -- which key helper
  use { 'goolord/alpha-nvim',                  config = function() require 'plugins/ui/alpha_nvim' end }       -- start page
  use { 'akinsho/nvim-toggleterm.lua',         config = function() require 'plugins/ui/toggleterm' end }       -- toggle terminal
  use { 'folke/todo-comments.nvim',            config = function() require 'plugins/ui/todo_comments' end }    -- highlight "todo" comments
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require 'plugins/ui/indent_blankline' end } -- indent line

  -- [[ LSP ]] ----------------------------------------------------------------------
  use {
    'neovim/nvim-lspconfig',
    config = function() require 'plugins/lsp' end,
    requires = {
      'williamboman/nvim-lsp-installer',
      'onsails/lspkind-nvim',
      'folke/lua-dev.nvim',
    },
  }

  use { -- cmp
    'hrsh7th/nvim-cmp',
    config = function() require 'plugins/lsp/cmp' end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  }

  use { 'RRethy/vim-illuminate',           config = function() require 'plugins/lsp/illuminate' end }
  use { 'stevearc/dressing.nvim',          config = function() require 'plugins/lsp/dressing' end }
  use { 'jose-elias-alvarez/null-ls.nvim', config = function() require 'plugins/lsp/null-ls' end }

  -- [[ Utils ]] --------------------------------------------------------------------
  use 'github/copilot.vim'            -- github copilot
  use 'matze/vim-move'                -- easy move lines
  use 'tpope/vim-sleuth'              -- auto set tab/space width
  use 'machakann/vim-sandwich'        -- selection pairs
  use 'kyazdani42/nvim-web-devicons'  -- icons
  use 'editorconfig/editorconfig-vim' -- support .editorconfig
  use { 'jghauser/mkdir.nvim',      config = function() require 'mkdir' end }                   -- create directory on save
  use { 'nacro90/numb.nvim',        config = function() require('numb').setup {} end }          -- preview line on :[number]
  use { 'phaazon/hop.nvim',         config = function() require 'plugins/utils/hop' end }       -- motion
  use { 'danymat/neogen',           config = function() require 'plugins/utils/neogen' end }    -- documetation comments
  use { 'numToStr/Comment.nvim',    config = function() require 'plugins/utils/comment' end }   -- easy comment lines
  use { 'nathom/filetype.nvim',     config = function() require 'plugins/utils/filetype' end }  -- faster replace to filetype.vim
  use { 'luukvbaal/stabilize.nvim', config = function() require 'plugins/utils/stabilize' end } -- stabilize buffer content
  use { 'windwp/nvim-autopairs',    config = function() require 'plugins/utils/autopairs' end } -- autopairs
  use { 'echasnovski/mini.nvim',    config = function() require 'plugins/utils/mini' end, branch = 'stable' } -- lots of utils
end
