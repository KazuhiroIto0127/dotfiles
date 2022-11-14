local wezterm = require 'wezterm';

return {
  font = wezterm.font("Noto Sans Mono"), -- 自分の好きなフォントいれる
  -- use_ime = true, -- wezは日本人じゃないのでこれがないとIME動かない
  font_size = 13.0,
  color_scheme = "Gruvbox Dark", -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.9,
}
