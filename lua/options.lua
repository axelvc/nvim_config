local g = vim.g
local o = vim.opt
local autocmd = vim.api.nvim_create_autocmd

-- misc
o.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
o.scrolloff = 5
o.splitbelow = true
o.splitright = true
o.hidden = true
g.mapleader = ' '
g.border = 'single'
g.signs = {
  error = ' ', -- 
  warn = ' ', -- 
  info = ' ', -- 
  hint = ' ', -- 
}

-- ui
o.cursorline = true
o.cursorlineopt = 'number'
o.cmdheight = 2
o.fillchars = { eob = ' ', stl = ' ', stlnc = ' ', diff = '/', fold = ' ' }
o.foldenable = false
o.foldtext = 'v:lua.custom_fold()'
o.guicursor = { 'a:blinkon550-blinkoff450', 'i:ver20', 'r-o:hor20', 'v:block' }
o.mouse = 'a'
o.signcolumn = 'yes:2'
o.termguicolors = true
o.wrap = false
o.breakindent = true
o.linebreak = true
o.showbreak = '››› '

-- indention
o.autoindent = true
o.smartindent = true
o.expandtab = true

-- search
o.ignorecase = true
o.smartcase = true

-- tabs
local indent = 2
o.shiftwidth = indent
o.softtabstop = indent
o.tabstop = indent

-- number column
o.number = true
o.relativenumber = true

-- window title
o.title = true
o.titlestring = 'Vim - ' .. vim.fn.expand('%:p:h:t', nil, nil)

-- performance
o.lazyredraw = true
o.timeoutlen = 400
o.updatetime = 0
o.swapfile = false

-- WSL clipboard
o.clipboard = 'unnamedplus'
g.clipboard = {
  name = 'win32yank-wsl',
  cache_enabled = 0,
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
}

-- disable auto comment on newline
autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    o.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

-- open help pages in vertical split
autocmd('BufEnter', {
  pattern = '*.txt',
  callback = function()
    if o.buftype:get() == 'help' then
      vim.cmd 'wincmd L'
    end
  end,
})

-- enable/disable smartcase in cmd
autocmd('CmdlineEnter', {
  pattern = '*',
  callback = function()
    o.smartcase = false
  end,
})

autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    o.smartcase = true
  end,
})

-- start teminals in insert mode
autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.cmd 'startinsert'
  end,
})
