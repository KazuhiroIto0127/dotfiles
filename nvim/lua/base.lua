vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.swapfile = false
vim.o.backup = false
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Seach down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- split
vim.opt.splitright = true -- 縦にsplitしたときに右に表示される。
vim.opt.splitbelow = true -- 横にsplitしたときに下に表示される。

-- highlights
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

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

vim.opt.formatoptions:append { 'r' }
