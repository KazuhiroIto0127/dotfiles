local state, wk = pcall(require, 'which-key')
if (not state) then return end

wk.setup {
  plugins = {
    spelling = { enabled = true },
    presets = { operators = false },
  },
  window = {
    border = "rounded",
    padding = { 2, 2, 2, 2 },
  },
  disable = { filetypes = { "TelescopePrompt" } },
}


wk.register({
  ["<leader>"] = {
    f = { name = "File" },
    g = { name = "Git" },
    s = { name = "Search" },
    S = { name = "Session" },
    t = { name = "Terminal" },
    p = { name = "Packages" },
    l = { name = "LSP" },
    u = { name = "UI" },
  },
})

-- wk.register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
--     gs = { "<cmd>Telescope git_status<cr>", "Git Status" },
--     b = { "<cmd>Telescope buffers<cr>", "Buffers" },
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
--     -- ["<leader>"] = { "<Cmd>Telescope frecency<CR>" },
--     -- ["1"] = "which_key_ignore", -- special label to hide it in the popup
--   },
-- }, { prefix = "<leader>" })
