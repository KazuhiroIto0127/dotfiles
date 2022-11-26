local status, ssm = pcall(require, "session_manager")
if not status then return end

ssm.setup({
  autoload_mode = "Disabled",
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_only_in_session = false,
})

local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    vim.cmd([[NeoTreeShow]])
  end,
})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionSavePre",
  group = config_group,
  callback = function()
    vim.cmd([[NeoTreeClose]])
  end,
})
