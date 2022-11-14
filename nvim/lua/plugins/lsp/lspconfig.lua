local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- local cmp_nvim_lsp_satus, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
-- if (not cmp_nvim_lsp_satus) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.html.setup {
  -- capabilities = capabilities,
  on_attach = on_attach,
}

nvim_lsp.cssls.setup {
  -- capabilities = capabilities,
  on_attach = on_attach,
}

nvim_lsp.tailwindcss.setup {
  -- capabilities = capabilities,
  on_attach = on_attach,
}

nvim_lsp.solargraph.setup {
  -- capabilities = capabilities,
  on_attach = on_attach,
}

nvim_lsp.sumneko_lua.setup {
  -- capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' }
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}
