local map = vim.keymap.set

require('Comment').setup {
  ignore = '^$',
  toggler = {
    line = 'gcc',
    block = 'gcb',
  },
  opleader = {
    line = 'gc',
    block = 'gb',
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA',
  },
  mappings = {
    basic = true,
    extra = true,
    extended = false,
  },
  pre_hook = function(ctx)
    local to_calculate = {
      typescriptreact = true,
      javascript = true
    }

    if to_calculate[vim.opt.filetype:get()] then
      local U = require 'Comment.utils'

      -- Determine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require('ts_context_commentstring.utils').get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring {
        key = type,
        location = location,
      }
    end
  end,
}

map('n', '<C-_>', 'gcc', { remap = true })
map('v', '<C-_>', 'gc', { remap = true })
