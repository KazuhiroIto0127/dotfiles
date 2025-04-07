local status, toggleterm = pcall(require, 'toggleterm')
if (not status) then return end

toggleterm.setup {
  size = 20,
  open_mapping = [[<C-t>f]],
  shading_factor = 2,
  shade_terminals = true,
  direction = "float",
  float_opts = {
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
    winblend = 15
  },
}

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

---------------
-- lazygit
---------------
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "none",
    width = 100000,
    height = 100000,
  },
  on_open = function(_)
    vim.cmd "startinsert!"
    -- vim.cmd "set laststatus=0"
  end,
  on_close = function(_)
    -- vim.cmd "set laststatus=3"
  end,
  count = 99,
}

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-t>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

---------------
-- Horizontal
---------------
local horizontal_term = Terminal:new {
  direction = "horizontal",
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "n",
      "<C-t>s",
      "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "t",
      "<C-t>s",
      "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "i",
      "<C-t>s",
      "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(term.bufnr, "", "<C-t>s", "<nop>", { noremap = true, silent = true })
  end,
  count = 3,
}

function _HORIZONTAL_TERM()
  horizontal_term:toggle(15)
end

vim.api.nvim_set_keymap("n", "<C-t>s", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
