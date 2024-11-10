require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window up" })

map("n", ";", ":", { desc = "CMD enter command mode" })

--------------------- Spell checking -------------------------------------------
map("n", "<leader>ln", function()
  vim.o.spell = false
  vim.cmd "echo 'Stopped spellchecker'"
end, { desc = "Turn off spellchecking" })

map("n", "<leader>le", function()
  vim.o.spelllang = "en_us"
  vim.o.spell = true
  vim.cmd "echo 'Spellchecking langugae set to English'"
end, { desc = "Set English language spellchecking" })

map("n", "<leader>lg", function()
  vim.o.spelllang = "el_GR"
  vim.o.spell = true
  vim.cmd "echo 'Spellchecking langugae set to Greek'"
end, { desc = "Set Greek language spellchecking" })

map("n", "<leader>lb", function()
  vim.o.spelllang = "en_us,el_GR"
  vim.o.spell = true
  vim.cmd "echo 'Spellchecking langugae set to English and Greek'"
end, { desc = "Set English and Greek language spellchecking" })

----------------- Yazi pluggin -------------------------------------------

map("n", "<C-n>", "<cmd>Yazi<cr>", { desc = "Yazi" })

map({ "n", "t" }, "<A-l>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatLazygit",
    cmd = "lazygit",
    float_opts = {
      relative = "editor",
      row = 0.06,
      col = 0.018,
      width = 0.95,
      height = 0.8,
      border = "",
    },
  }
end, { desc = "Toggle floating term with Lazygit" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
