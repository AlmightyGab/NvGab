return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- "lua-language-server",
      -- "stylua",
      --
      -- C/C++
      "clangd",
      "clang-format",
      "codelldb",

      -- Javascript
      --"js-debug-adapter",

      -- golang
      --"gopls",

      -- Python
      --"black",
      "debugpy",
      "mypy",
      "ruff",
      "pyright",

      -- Rust
      --"rust-analyzer",

      -- web
      -- "tsserver"
      --"html-lsp",
      --"css-lsp" ,
      --"prettier"
    },
  },
}
