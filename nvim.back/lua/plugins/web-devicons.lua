local state, icons = pcall(require, 'nvim-web-devicons')
if (not state) then return end

icons.setup {
  override = {},
  default = true
}
