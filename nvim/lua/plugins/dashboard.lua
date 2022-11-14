local status, db = pcall(require, 'dashboard')
if (not status) then return end

local home = os.getenv('HOME')
db.preview_command = 'cat | lolcat -F 0.3'
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
  { icon = '  ',
    desc = 'Recently latest session                  ',
    shortcut = 'SPC S',
    action = 'Telescope session-lens search_session' },
  { icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f' },
  { icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w' },
}
-- db.session_directory          -- string type the directory to store the session file
-- db.session_auto_save_on_exit  -- boolean default is false.it will auto-save the current session on neovim exit if a session exists and more than one buffer is loaded
-- db.session_verbose            -- boolean default true.it will display the session file path on SessionSave and SessionLoad
--
-- -- Custom events
-- DBSessionSavePre   -- a custom user autocommand to add functionality before auto-saving the current session on exit
-- DBSessionSaveAfter -- a custom user autocommand to add functionality after auto-saving the current session on exit
--
-- -- Example: Close NvimTree buffer before auto-saving the current session
-- autocmd('User', {
--     pattern = 'DBSessionSavePre',
--     callback = function()
--       pcall(vim.cmd, 'NvimTreeClose')
--     end,
-- })
--
--
-- -- Highlight Group
-- DashboardHeader DashboardCenter DashboardShortCut DashboardFooter
--
-- -- Command
--
-- DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
-- SessionSave,SessionLoad,SessionDelete
