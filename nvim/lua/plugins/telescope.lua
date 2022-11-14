local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "  ",
    selection_caret = "➤ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    results_title = false,
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      preview_cutoff = 120,
      width = 0.6,
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    path_display = {
      "absolute"
    },
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = { ".git/.*", "tmp/.*", "node_modules/.*" },
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 10,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ["<C-s>"] = actions.file_split,
        ["<C-i>"] = actions.file_vsplit,
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({})
    },
    frecency = {
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
      disable_devicons = false,
    },
    session_lens = {
    }
  },
}

require "telescope".load_extension("frecency")
require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')
require("telescope").load_extension("session-lens")


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Space>f',
  '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true})<cr>',
  opts)
vim.keymap.set('n', '<Space>s', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
vim.keymap.set('n', '<Space>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
vim.keymap.set('n', '<Space>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
vim.keymap.set('n', '<Space>1', '<cmd>lua require("telescope.builtin").symbols()<cr>', opts)
vim.keymap.set('n', '<Space>x', '<cmd>lua require("telescope.builtin").git_status()<cr>', opts)
vim.keymap.set('n', '<Space>c', '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
vim.keymap.set("n", "<Space><Space>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
  { noremap = true, silent = true })
vim.keymap.set("n", "<Space>S", "<Cmd>lua require('session-lens').search_session()<CR>",
  { noremap = true, silent = true })
