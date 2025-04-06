local status, fzf = pcall(require, 'fzf-lua')
if (not status) then return end
local actions = require "fzf-lua.actions"

fzf.setup({
  -- winopts = {
  -- split      = "belowright new",
  -- height     = 0.15, -- window height
  -- width      = 0.80, -- window width
  -- row        = 0.35, -- window row position (0=top, 1=bottom)
  -- col        = 0.50, -- window col position (0=left, 1=right)
  -- border     = 'rounded', -- 'none', 'single', 'double', 'thicc' or 'rounded'
  -- fullscreen = false, -- start fullscreen?
  -- },
  actions = {
    files = {
      ["default"] = actions.file_edit_or_qf,
      ["ctrl-s"]  = actions.file_split,
      ["ctrl-i"]  = actions.file_vsplit,
      ["ctrl-t"]  = actions.file_tabedit,
      ["alt-q"]   = actions.file_sel_to_qf,
      ["alt-l"]   = actions.file_sel_to_ll,
    },
    buffers = {
      ["default"] = actions.buf_edit,
      ["ctrl-s"]  = actions.buf_split,
      ["ctrl-i"]  = actions.buf_vsplit,
      ["ctrl-t"]  = actions.buf_tabedit,
    }
  }
})

vim.cmd [[
highlight FzfLuaNormal guibg=#383850
highlight FzfLuaBorder guibg=#383850
]]

-- vim.opt.winblend = 5
vim.opt.termguicolors = true
