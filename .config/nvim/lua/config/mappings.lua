local map = vim.keymap.set

----------------- Moving around ----------------

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window up" })

map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "<leader>x", "<cmd>bd!<cr>", { desc = "Close Current Buffer" })

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

--------------------- nvim dap -----------------------------------------------

map({ "n" }, "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Dap toggle breakpoint" })
map({ "n" }, "<leader>dc", "<cmd> DapContinue <cr>", { desc = "Dap continue" })

--------------------- Spell checking -------------------------------------------
map("n", "<leader>ln", function()
	vim.o.spell = false
	vim.cmd("echo 'Stopped spellchecker'")
end, { desc = "Turn off spellchecking" })

map("n", "<leader>le", function()
	vim.o.spelllang = "en_us"
	vim.o.spell = true
	vim.cmd("echo 'Spellchecking langugae set to English'")
end, { desc = "Set English language spellchecking" })

map("n", "<leader>lg", function()
	vim.o.spelllang = "el_GR"
	vim.o.spell = true
	vim.cmd("echo 'Spellchecking langugae set to Greek'")
end, { desc = "Set Greek language spellchecking" })

map("n", "<leader>lb", function()
	vim.o.spelllang = "en_us,el_GR"
	vim.o.spell = true
	vim.cmd("echo 'Spellchecking langugae set to English and Greek'")
end, { desc = "Set English and Greek language spellchecking" })

-- Much easier to spam [s ]s to navigate and z[ or z] to change spelling
-- Also this makes it so you can get first suggestion with <CR> so no need to move hand to number :)
map("n", "z]", "<cmd> Telescope spell_suggest initial_mode=normal<cr>", { desc = "Spelling Sugestion" })
map("n", "z[", "<cmd> Telescope spell_suggest initial_mode=normal<cr>", { desc = "Spelling Sugestion" })

----- format --------
map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

--------------------------- Comment----------------
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>m", "<cmd>Telescope marks initial_mode=normal<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>th", "<cmd>Telescope colorscheme<cr>", { desc = "telescope change theme" })
map("n", "<leader>fn", "<cmd>Telescope file_browser initial_mode=normal<cr>", { desc = "telescope file browser" })
map("n", "<C-n>", "<cmd>Telescope file_browser initial_mode=normal<cr>", { desc = "telescope file browser" })
map("n", "<leader>:", "<cmd>Telescope command_history initial_mode=normal<cr>", { desc = "telescope command history" })
map("n", "<leader>fq", "<cmd>Telescope quickfix initial_mode=normal<cr>", { desc = "telescope quickfix list" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics initial_mode=normal<cr>", { desc = "telescope lsp diagonstics" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map(
	{ "n", "t" },
	"<A-v>",
	"<cmd>ToggleTerm size=55 direction=vertical<cr>",
	{ desc = "terminal toggleable vertical term" }
)
map(
	{ "n", "t" },
	"<A-h>",
	"<cmd>ToggleTerm size=20 direction=horizontal<cr>",
	{ desc = "terminal toggleable horizontal term" }
)
map({ "n", "t" }, "<A-f>", "<cmd>ToggleTerm direction=float<cr>", { desc = "terminal toggleable floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

--Terminal apps
-- lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", display_name = "Lazygit", direction = "float", hidden = true })
function _Lazygit_toggle()
	lazygit:toggle()
end

map({ "n", "t" }, "<A-g>", "<cmd>lua _Lazygit_toggle()<cr>", { desc = "Toggle floating term with Lazygit" })

-- bottom
local bottom = Terminal:new({ cmd = "btm", display_name = "Bottom", direction = "float", hidden = true })
function _Bottom_toggle()
	bottom:toggle()
end
map({ "n", "t" }, "<A-b>", "<cmd>lua _Bottom_toggle()<cr>", { desc = "Toggle floating term with system monitor" })
