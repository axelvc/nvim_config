local bufferline = require 'bufferline'
local map = vim.keymap.set

bufferline.setup {
  options = {
    tab_size = 20,
    max_name_length = 15,
    show_close_icon = false,
    show_tab_indicators = false,
    separator_style = { '⏽', '⏽' },
    indicator_icon = ' ',
    modified_icon = '',
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, dict)
      if level == 'info' then
        return ''
      end

      return ('(%s)'):format(count - (dict.info or 0))
    end,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'center',
      },
    },
  },
  highlights = {
    separator = {
      guifg = {
        highlight = 'TabLine',
        attribute = 'fg',
      },
    },
  },
}

-- delete buffer
map('n', '<Leader>bd', ':bp|bd #<CR>')

-- select buffer
map('n', '<Leader>bs', bufferline.pick_buffer)

-- focus hover
map('n', 'H', function() bufferline.cycle(-1) end)
map('n', 'L', function() bufferline.cycle(1) end)

-- move buffer
map('n', '<Leader>bh', function() bufferline.move(-1) end)
map('n', '<Leader>bl', function() bufferline.move(1) end)

local exist, wk = pcall(require, 'which-key')
if exist then
  wk.register {
    ['<Leader>b'] = {
      name = 'Buffer',
      d = 'Delete',
      s = 'Select',
      h = 'Move current to left',
      l = 'Move current to right',
    },
  }
end
