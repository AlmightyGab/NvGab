-- Define a function that runs when any LSP attaches
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- General LSP navigation
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

  -- Hover & signature help
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)

  -- Code actions & renaming
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

  -- Diagnostics navigation
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

  -- Formatting (conditionally if the server supports it)
  if client.supports_method('textDocument/formatting') then
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end
end

-- Export for other configs (clangd.lua, pyright.lua)
return {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
