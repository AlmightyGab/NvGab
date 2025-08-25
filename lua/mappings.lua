require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Telescope
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>ft", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
map("n", "<leader>td", "<cmd>Telescope diagnostics<cr>", { desc = "Show diagnostics" })


map("n", "<leader>gn", function () vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" })
map("n", "<leader>gp", function () vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" })
map("n", "<leader>gl", "<cmd>Telescope diagnostics<cr>", { desc = "Open Telescope diagnostics" })


-- Git-Fugitive
map("n", "<leader>G", "<cmd>Git<cr>", { desc = "Open Git-Fugitive" })
map("n", "<leader>L", "<cmd>Gclog<cr>", { desc = "Open Git Log" })
