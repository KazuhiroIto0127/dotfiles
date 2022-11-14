local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {}
}
-- ---------------
-- lspsaga
-- ---------------
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'dj', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'df', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', 'dh', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'dp', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'dr', '<Cmd>Lspsaga rename<cr>', opts)
