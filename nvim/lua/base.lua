vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.swapfile = false
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.breakindent = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.path:append { '**' } -- Finding files - Seach down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.timeoutlen = 500
vim.opt.undofile = true

-- File
vim.opt.backup = false

-- Cursor
-- vim.opt.whichwrap = 'b,s,h,l' -- 行頭・行末でもhjklで前後の行に移動 → いらない
vim.opt.scrolloff = 10

-- Mouse
vim.opt.mouse = 'a'

-- Edit
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.showmatch = true -- 括弧入力時の対応する括弧を表示
vim.opt.matchtime = 1
vim.opt.matchpairs:append { '<:>' }
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.formatoptions:append { 'mM' } -- m・・行整形時マルチバイト文字でも改行。M・・行を連結したときにマルチバイト文字なら空白を入れない
vim.opt.virtualedit:append { 'block' }

-- Display
vim.opt.cursorline = true
vim.wo.number = true
vim.opt.list = true
vim.opt.wrap = false -- No wrap lines
vim.opt.showcmd = true
vim.opt.title = true
vim.opt.pumheight = 10 -- ポップアップメニューの高さを１０
vim.opt.pumblend = 10 -- 補完などに使われるポップアップメニューを半透明に表示します。
vim.opt.winblend = 10 -- 任意の floating windows を半透明に表示します。
vim.opt.signcolumn = "yes" -- gitsignのガタツキをなくす
vim.opt.winbar = "%f" -- 各bufferのwindowの上部に表示できる
vim.opt.cmdheight = 0 -- コマンド入力欄の高さを0にする
vim.opt.laststatus = 3 -- 3・・・ステータスバーがglobalに１つになる

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- split
vim.opt.splitright = true -- 縦にsplitしたときに右に表示される。
vim.opt.splitbelow = true -- 横にsplitしたときに下に表示される。

-- highlights
vim.opt.termguicolors = true
vim.opt.wildoptions = 'pum'

-- colorscheme
vim.opt.background = 'dark'
vim.cmd([[colorscheme github_dark_default]])

-- cmp-spell用設定
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- but this doesn't work on iTerm2

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})
-- 初回起動でNeoTree起動
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = '*',
--   command = "NeoTreeShow",
-- })
