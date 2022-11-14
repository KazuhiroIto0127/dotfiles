local status, neo_tree = pcall(require, 'neo-tree')
if (not status) then return end

neo_tree.setup({
  window = {
    position = "left",
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<C-s>"] = "open_split",
      ["<C-i>"] = "open_vsplit",
    }
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false
    },
  },
})
