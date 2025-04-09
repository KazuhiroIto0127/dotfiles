return {
  "folke/which-key.nvim",
  opts = function(_, _)
    local wk = require("which-key")

    wk.add({
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Neotree toggle" },
    })
  end,
}
