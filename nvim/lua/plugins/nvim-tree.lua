-- なぜか<C-i>でvsplitがうまく機能しない。。不具合だと思う
local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- -- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

nvim_tree.setup({
  open_on_setup = true,
  open_on_setup_file = true,
  open_on_tab = true,
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  view = {
    mappings = {
      list = {
        -- remove a default mapping for cd
        { key = "<C-i>", action = "" },
        { key = "<C-s>", action = "" },
        -- { key = "<C-v>", action = "" },
        -- { key = "<C-x>", action = "" },
        -- custom
        { key = "<C-i>", action = "vsplit" },
        { key = "<C-s>", action = "split" },
        -- { key = "<C-t>", action = "tabnew" },
      }
    }
  },
  -- actions = {
  --   open_file = {
  --     quit_on_open = false,
  --     window_picker = {
  --       enable = false,
  --     },
  --   },
  -- }
})
