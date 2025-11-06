-- ~/.config/nvim/lua/lsp/clangd.lua (or wherever your setup expects it)
return {
  -- Common, conservative flags that age well
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",       -- or "never" if you dislike auto-includes
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--pch-storage=memory",
    "--fallback-style=llvm",         -- respects .clang-format if present
    "--offset-encoding=utf-16",      -- keeps compatibility with most setups
    -- macOS/Homebrew LLVM (uncomment if you use it to fix diagnostics/includes)
    -- "--query-driver=/usr/bin/clang,**/bin/clang,**/bin/clang++,/opt/homebrew/opt/llvm/bin/clang,/opt/homebrew/opt/llvm/bin/clang++",
  },

  -- If your loader supports it, this is honored; otherwise use root_dir below
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },

  -- Keep it broad; trim if you like
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },

  -- If your lsp loader accepts root_dir, this mirrors lspconfig’s default
  root_dir = (function()
    local util_ok, util = pcall(require, "lspconfig.util")
    return util_ok and util.root_pattern("compile_commands.json", "compile_flags.txt", ".git") or nil
  end)(),

  -- Extra niceties clangd understands
  init_options = {
    clangdFileStatus = true,         -- shows per-file status in LSP progress
    fallbackFlags = { "-std=c++20" },-- used when no compile_commands.json
    usePlaceholders = true,          -- snippet-style arg placeholders
    completeUnimported = true,
    semanticHighlighting = true,     -- older clangd flag (harmless if ignored)
  },

  -- Hand off richer capabilities to clangd (for nvim-cmp, snippets, etc.)
  capabilities = (function()
    local caps = vim.lsp.protocol.make_client_capabilities()
    -- If you use nvim-cmp, this adds all the classic completion capabilities
    local ok, cmp = pcall(require, "cmp_nvim_lsp")
    if ok then caps = cmp.default_capabilities(caps) end
    -- clangd historically prefers utf-16; keep both to be safe if your loader allows
    caps.offsetEncoding = { "utf-16" }
    return caps
  end)(),

  -- Light-touch on_attach: inlay hints + semantic tokens if available
  on_attach = function(client, bufnr)
    -- Inlay hints (types, param names) – easy win
    if vim.lsp.inlay_hint then
      pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
    end

    -- Semantic tokens (lets theme color C/C++ syntax by semantics)
    if client.server_capabilities.semanticTokensProvider then
      pcall(vim.lsp.semantic_tokens.start, bufnr, client.id)
    end

    -- Optional: format on save using clang-format if you like that workflow
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   buffer = bufnr,
    --   callback = function() vim.lsp.buf.format({ async = false }) end,
    -- })
  end,
}
