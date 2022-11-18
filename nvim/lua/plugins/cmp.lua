local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'
local tabnine = require('cmp_tabnine.config')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behaviior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'emoji' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'calc' },
    { name = 'buffer' },
    { name = 'mocword' },
    { name = 'treesitter' },
    { name = 'cmp_tabnine' },
    {
      name = "dictionary",
      keyword_length = 2,
    },
    {
      name = 'spell',
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      },
    },
  }),
  formatting = {
    format = lspkind.cmp_format({ wirth_text = false, maxwidth = 50 })
  }
})

-- コマンドのサジェストはnoiceで行うためコメントアウト
-- cmp.setup.cmdline(':', {
--   sources = {
--     { name = 'cmdline' }
--   }
-- })

tabnine.setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
  ignored_file_types = {
    -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  },
  show_prediction_strength = false
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
