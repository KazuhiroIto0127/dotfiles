require('plugins-setup')
require('base')
require('keymaps')
require('plugins.telescope')
require('plugins.smart-splits')
require('plugins.bufferline')
require('plugins.comment')
require('plugins.colorizer')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.ts-autotag')
require('plugins.web-devicons')
require('plugins.scrollbar')
require('plugins.cmp')
require('plugins.autopairs')
require('plugins.null-ls')
require('plugins.prettier')
require('plugins.neo-tree')
require('plugins.git')
require('plugins.neogit')
require('plugins.indent-blankline')
require('plugins.lsp.lspkind')
require('plugins.lsp.mason')
require('plugins.lsp.lspsaga')
require('plugins.lsp.lspconfig')
require('plugins.alpha')
require('plugins.vgit')
require('plugins.surround')
require('plugins.toggleterm')
require('plugins.session_manager')
require('plugins.which-key')
require('plugins.cursorline')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  vim.opt.clipboard:append { 'unnamedplus' }
end
if is_win then
  vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
