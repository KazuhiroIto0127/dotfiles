vim.g.mapleader = " " -- space

local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word  backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', { noremap = true })

-- New tab
keymap.set('n', 'tc', ':tabnew<CR>', { noremap = true, silent = true })

-- ;でコマンド入力( ;と:を入れ替)
keymap.set("n", ";", ":", { noremap = true })

-- ESC*2 でハイライトやめる
keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- jjで挿入モードから抜ける設定
keymap.set("i", 'jj', "<ESC>", { noremap = true, silent = true })
-- 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
keymap.set("i", 'っｊ', "<ESC>", { noremap = true, silent = true })

-- insert mode での移動
keymap.set("i", '<C-e>', "<END>", { noremap = true })
keymap.set("i", '<C-a>', "<HOME>", { noremap = true })

-- インサートモードでもhjklで移動（Ctrl押すけどね）
keymap.set("i", '<C-j>', "<Down>", { noremap = true })
keymap.set("i", '<C-k>', "<Up>", { noremap = true })
keymap.set("i", '<C-h>', "<Left>", { noremap = true })
keymap.set("i", '<C-l>', "<Right>", { noremap = true })

-- exモードになるのを防ぐ
keymap.set("n", 'Q', "<Nop>", { noremap = true })
keymap.set("n", '<C-q>', "<Nop>", { noremap = true })
-- tmuxのprefixにしたから消す。（vimにおける一旦ポーズ）
keymap.set("n", '<C-z>', "<Nop>", { noremap = true })
-- toggletermのprefixにするから消す。
keymap.set("n", '<C-t>', "<Nop>", { noremap = true })

-- neovim設定をリフレッシュ
keymap.set("n", '<leader>r', ":luafile %<CR>")

-- **************
-- plugins  ↓
-- **************

-- ---------------
-- nvim-bufferline
-- ---------------
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})

-- ---------------
-- fzf-lua
-- ---------------
-- vim.keymap.set('n', '<leader>f', "<cmd>lua require('fzf-lua').files()<CR>")
-- vim.keymap.set('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>")
-- <Ctrl-G> でRegex Search（正規表現検索）とFuzzy Search（あいまい検索）を切り替えることができます。
-- vim.keymap.set('n', '<leader>s', "<cmd>lua require('fzf-lua').live_grep()<CR>")

-- ---------------
-- NeoGit
-- ---------------
vim.keymap.set('n', '<leader>gs', "<cmd>Neogit<CR>")
-- ---------------
-- diffview
-- ---------------
vim.keymap.set('n', '<leader>gh', "<cmd>DiffviewFileHistory %<CR>")

-- ---------------
-- NeoTree
-- ---------------
local status, _ = pcall(require, 'neo-tree')
if (status) then
  vim.keymap.set('n', '<leader>e', "<cmd>NeoTreeShowToggle<CR>", { desc = "Toggle Explorer" })
  vim.keymap.set('n', '<leader>E', "<cmd>Neotree reveal<cr>", { desc = "Focus Explorer" })
end

-- ---------------
-- smart-splits
-- ---------------
local status, _ = pcall(require, 'smart-splits')
if (status) then
  -- resizing splits
  -- alt押しながらhjkl
  -- altが<A>として認識されるようにするには、iTerm2の設定でProfiles>Keys>ESC+にする必要あり
  vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
  vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
  vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
  vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
  -- moving between splits
  vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
  vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
  vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
  vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
end

-- ---------------
-- session_manager
-- ---------------
local ok, _ = pcall(require, 'session_manager')
if ok then
  vim.keymap.set('n', '<leader>Ss', '<cmd>lua require("session_manager").save_current_session()<cr>',
    { desc = 'Save this session' })
  vim.keymap.set('n', '<leader>Sd', '<cmd>lua require("session_manager").delete_session()<cr>',
    { desc = 'Delete session' })
  vim.keymap.set('n', '<leader>Sl', '<cmd>lua require("session_manager").load_session()<cr>',
    { desc = 'Load last session' })
end


-- ---------------
-- toggleterm
-- ---------------
local ok, _ = pcall(require, 'toggleterm')
if ok then
  vim.keymap.set('n', "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
  vim.keymap.set('n', "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    { desc = "ToggleTerm horizontal split" })
  vim.keymap.set('n', "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",
    { desc = "ToggleTerm vertical split" })
end
