return {
  "mfussenegger/nvim-dap",
  config = function(_, opts)
    local dap = require("dap")

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = 8123,
      executable = {
        command = "js-debug-adapter",
      }
    }

    for _, language in ipairs { "typescript", "javascript" } do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
        },
      }
    end

    local map = vim.keymap.set
    map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
    map("n",
      "<leader>dus",
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      { desc = "Open debugging sidebar"})
    map("n", "<leader>dr", "<cmd> DapContinue <cr>", { desc = "Run or continue the debugger" })
    map("n", "<f10>", "<cmd> DapStepOver <cr>", { desc = "Step Over next statement" })
    map("n", "<f11>", "<cmd> DapStepInto <cr>", { desc = "Step Into next statement" })
    map("n", "<S-f11>", "<cmd> DapStepOut <cr>", { desc = "Step Out statement" })
  end
}
