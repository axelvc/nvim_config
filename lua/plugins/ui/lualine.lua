local o = vim.opt

---@param str string
---@return string
local function get_initials(str)
  local short_mode = str:sub(1, 1)

  for letter in str:gmatch '-%w' do
    short_mode = short_mode .. letter
  end

  return short_mode
end

require('lualine').setup {
  options = {
    section_separators = { left = '▙', right = '▜' },
    component_separators = { left = '⏽', right = '⏽' },
    padding = 2,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = get_initials,
      },
    },
    lualine_b = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        always_visible = false,
        symbols = vim.g.signs,
      },
    },
    lualine_c = {
      {
        'branch',
        icon = '',
        separator = '',
        padding = { left = 2, right = 0 },
      },
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
        separator = '',
        padding = { left = 2, right = 0 },
      },
    },
    lualine_x = {
      {
        'encoding',
        cond = function()
          return o.fileencoding:get() ~= 'utf-8'
        end,
      },
      {
        'fileformat',
        cond = function()
          return o.fileformat:get() ~= 'unix'
        end,
      },
      {
        function()
          return o.filetype:get()
        end,
      },
    },
    lualine_y = {
      '%l  %c',
    },
    lualine_z = {
      '% Lines: %L',
    },
  },
  extensions = {
    {
      filetypes = { 'alpha' },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = get_initials,
          },
        },
        lualine_z = {
          '% Alpha',
        },
      },
    },
  },
}
