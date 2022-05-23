local gitsigns = require 'gitsigns'

gitsigns.setup {
  signs = {
    add = { text = '▎' },
    change = { text = '▎' },
    delete = { text = '' },
    topdelete = { text = '' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local function bmap(modes, keys, map)
      vim.keymap.set(modes, keys, map, opts)
    end

    -- navigation
    bmap('n', '[g', gitsigns.prev_hunk)
    bmap('n', ']g', gitsigns.next_hunk)

    -- stage
    bmap({ 'n', 'v' }, '<leader>ga', ':Gitsigns stage_hunk<CR>')
    bmap({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>')
    bmap('n', '<leader>gu', gitsigns.undo_stage_hunk)
    bmap('n', '<leader>gA', gitsigns.stage_buffer)
    bmap('n', '<leader>gR', gitsigns.reset_buffer)

    -- diff
    bmap('n', '<leader>gp', gitsigns.preview_hunk)
    bmap('n', '<leader>gd', function() gitsigns.diffthis '~' end)

    -- git blame
    bmap('n', '<leader>gb', gitsigns.blame_line)

    -- select inner hunk
    bmap({ 'x', 'o' }, 'ig', ':<C-U>Gitsigns select_hunk<CR>')

    -- which key documentation
    local exists, wk = pcall(require, 'which-key')
    if exists then
      wk.register({
        ['[g'] = 'Previous git hunk',
        [']g'] = 'Next git hunk',
        ['<Leader>'] = {
          g = {
            name = 'Git',
            a = 'Stage hunk',
            A = 'Stage buffer',
            b = 'Blame cursor',
            d = 'Diff buffer',
            p = 'Preview hunk',
            r = 'Reset hunk',
            R = 'Undo buffer',
            u = 'Undo hunk',
          },
        },
      }, { buffer = bufnr })
      wk.register({
        ['<Leader>'] = {
          g = {
            name = 'Git',
            a = 'Stage selection',
            r = 'Reset selection',
          },
        },
      }, { buffer = bufnr, mode = 'v' })
      wk.register({ ig = 'inner git hunk' }, { buffer = bufnr, mode = 'x' })
      wk.register({ ig = 'inner git hunk' }, { buffer = bufnr, mode = 'o' })
    end
  end,
}
