return
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      -- default
      -- "vim", "lua", "vimdoc",
      -- "html", "css"
      "c",
      --"css",
      "cpp",
      "cmake",
      --"dockerfile",
      --"elixir",
      --"go",
      --"haskell",
      --"html",
      --"javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      --"rust",
      --"toml",
      --"tsx",
      --"typescript",
      -- "vim",
      -- "vimdoc",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      }
    }
  },
}
