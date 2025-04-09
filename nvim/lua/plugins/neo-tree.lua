return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  opts = {
    window = {
      position = "left", -- サイドバーの位置
      width = 30,
      mappings = {
        ["<C-s>"] = "open_split",
        ["<C-i>"] = "open_vsplit",
      },
    },
    filesystem = {
      follow_current_file = true, -- 現在開いているファイルを自動で追従
      use_libuv_file_watcher = true, -- 自動でファイル変更を検知
      filtered_items = {
        hide_dotfiles = false,
      },
    },
    buffers = {
      follow_current_file = true,
    },
    git_status = {
      window = {
        position = "float",
      },
    },
  },
}
