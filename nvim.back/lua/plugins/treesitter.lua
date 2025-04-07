local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    diable = {},
  },
  ensure_installed = {
    'json',
    'javascript',
    'typescript',
    'tsx',
    'yaml',
    'html',
    'css',
    'markdown',
    'graphql',
    'bash',
    'lua',
    'vim',
    'ruby',
    'dockerfile',
    'gitignore',
    'vue',
    'pug',
  },
  autopairs = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  rainbow = {
    enable = true,
    disable = { "html" },
    extended_mode = false,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
  endwise = {
    enable = true,
  }
}
