local o = vim.opt

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'json',
    'jsonc',
    'python',
    'go',
    'rust',
    'lua',
    'css',
    'astro',
    'vim',
    'bash',
    'scss',
    'jsdoc',
    'svelte',
    'vue',
    'regex',
    'graphql',
    'toml',
    'tsx',
    'yaml',
    'http',
  },
}

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.parsers').filetype_to_parsername.json = 'jsonc'
