local status, neo_tree = pcall(require, 'neo-tree')
if (not status) then return end

neo_tree.setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },
  source_selector = {
    winbar = true,
    statusline = false,
    show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
    -- of the top visible node when scrolled down.
    tab_labels = { -- falls back to source_name if nil
      filesystem = "  Files ",
      buffers = "  Buffers ",
      git_status = "  Git ",
      diagnostics = " 裂Diagnostics ",
    },
    content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
    --                start  : |/ 裡 bufname     \/...
    --                end    : |/     裡 bufname \/...
    --                center : |/   裡 bufname   \/...
    tabs_layout = "equal", -- start, end, center, equal, focus
    --             start  : |/  a  \/  b  \/  c  \            |
    --             end    : |            /  a  \/  b  \/  c  \|
    --             center : |      /  a  \/  b  \/  c  \      |
    --             equal  : |/    a    \/    b    \/    c    \|
    --             active : |/  focused tab    \/  b  \/  c  \|
    truncation_character = "…", -- character to use when truncating the tab label
    tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
    tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
    padding = 0, -- can be int or table
    -- padding = { left = 2, right = 0 },
    -- separator = "▕", -- can be string or table, see below
    separator = { left = "▏", right = "▕" },
    -- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
    -- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
    -- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
    -- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
    -- separator = "|",                                              -- ||  a  |  b  |  c  |...
    separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
    show_separator_on_edge = false,
    --                       true  : |/    a    \/    b    \/    c    \|
    --                       false : |     a    \/    b    \/    c     |
    highlight_tab = "NeoTreeTabInactive",
    highlight_tab_active = "NeoTreeTabActive",
    highlight_background = "NeoTreeTabInactive",
    highlight_separator = "NeoTreeTabSeparatorInactive",
    highlight_separator_active = "NeoTreeTabSeparatorActive",
  },
  default_component_configs = {
    indent = { padding = 0 },
  },
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
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = { mappings = { h = "toggle_hidden" } },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false
    },
  },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
})
