-- lua/plugins/diagnostics.lua
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvlsp = require("nvchad.configs.lspconfig")
      nvlsp.defaults()  -- loads NvChad keymaps/capabilities

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        severity_sort = true,
        float = { border = "rounded", source = "if_many", focusable = false },
      })

      vim.o.updatetime = 250
      local grp = vim.api.nvim_create_augroup("DiagnosticsFloat", { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = grp,
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
        end,
      })
    end,
  },
}
