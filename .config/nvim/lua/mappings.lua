require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window up" })

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
