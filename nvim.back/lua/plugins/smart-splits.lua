local status, smart_splits = pcall(require, 'smart-splits')
if (not status) then return end

smart_splits.setup {
  default_amount = 5,
}
