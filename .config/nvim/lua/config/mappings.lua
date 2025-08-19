local map = vim.keymap.set

----------------- Moving around ----------------
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

local nvim_tmux_nav = require("nvim-tmux-navigation")
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<tab>", "<cmd>bnext<cr>")
map("n", "<S-tab>", "<cmd>bprev<cr>")
map("n", "<leader>x", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close Current Buffer" })

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Paste last yank
map({ "n", "v" }, "<C-p>", '"0p', { noremap = true, silent = true, desc = "Paste last yank" })

--------------- Compilation mode --------------------------------

-- quickfix list
vim.keymap.set("n", "<A-j>", vim.cmd.cnext, { silent = true, desc = "Next quickfix entry" })
vim.keymap.set("n", "<A-k>", vim.cmd.cprevious, { silent = true, desc = "Previous quickfix entry" })

-- build and open quickfix list
local function run_build(opts)
	local qf_width = 20 -- Size of the qfix list, putting it here as a switch

	local filename = vim.api.nvim_buf_get_name(0)
	if not filename or filename == "" then
		print("Cannot build, no file name.")
		return
	end

	local command

	-- Check if the current file is a GLSL shader
	if filename:match("%.vert$") then
		local dir = vim.fn.fnamemodify(filename, ":h")
		command = "glslc " .. vim.fn.shellescape(filename) .. " -o " .. vim.fn.shellescape(dir .. "/vert.spv")
	elseif filename:match("%.frag$") then
		local dir = vim.fn.fnamemodify(filename, ":h")
		command = "glslc " .. vim.fn.shellescape(filename) .. " -o " .. vim.fn.shellescape(dir .. "/frag.spv")
	else
		-- Fallback to the build.sh command, now including the filename
		command = opts.build_command .. " " .. vim.fn.shellescape(filename)
	end

	vim.cmd('cexpr system("' .. command .. '")')

	vim.cmd("copen" .. qf_width)
end

vim.keymap.set("n", "<leader>cd", function()
	run_build({ build_command = "bash build.sh -d" })
end, { noremap = true, silent = true, desc = "Build debug or compile shader" })

vim.keymap.set("n", "<leader>cr", function()
	run_build({ build_command = "bash build.sh -r" })
end, { noremap = true, silent = true, desc = "Build release or compile shader" })

----------------------------- file browser ---------------------

map("n", "<C-n>", "<CMD>e.<CR>", { desc = "Open file browser" })

--------------- harpoon stuff ------------------------------------
-- this is basically better marks
local harpoon = require("harpoon")

vim.keymap.set("n", "<C-a>", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<C-1>", function()
	harpoon:list():select(1)
end, { nowait = true, silent = true, desc = "Harpoon select 1" })
vim.keymap.set("n", "<C-2>", function()
	harpoon:list():select(2)
end, { nowait = true, silent = true, desc = "Harpoon select 2" })
vim.keymap.set("n", "<C-3>", function()
	harpoon:list():select(3)
end, { nowait = true, silent = true, desc = "Harpoon select 3" })
vim.keymap.set("n", "<C-4>", function()
	harpoon:list():select(4)
end, { nowait = true, silent = true, desc = "Harpoon select 4" })
vim.keymap.set("n", "<C-5>", function()
	harpoon:list():select(5)
end, { nowait = true, silent = true, desc = "Harpoon select 4" })
vim.keymap.set("n", "<C-6>", function()
	harpoon:list():select(6)
end, { nowait = true, silent = true, desc = "Harpoon select 4" })

-------- lsp stuff----------------

map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>h", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

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
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

----------------------- telescope ------------------------------------------
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fW", "<cmd>Telescope grep_string<CR>", { desc = "telescope grep word under cursor" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>m", "<cmd>Telescope marks initial_mode=normal<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files({
		prompt_title = "Find Files",
		find_command = {
			"fd",
			"--type",
			"file",
			"-L",
			"--prune",
			"--hidden",
			"--exclude",
			".git",
			"--max-depth=6",
		},
	})
end, { desc = "telescope find files" })

map("n", "<leader>t", "<cmd>Telescope tags<CR>", { desc = "telescope search tags" })

vim.keymap.set("n", "<leader>fd", function()
	require("telescope.builtin").find_files({
		prompt_title = "Browse Directories",
		cwd = "~",
		find_command = {
			"fd",
			"--type",
			"dir",
			"--hidden",
			"--exclude",
			".git",
			".",
			vim.fn.expand("~"),
		},
		attach_mappings = function(prompt_bufnr, map)
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			map({ "i", "n" }, "<CR>", function()
				local entry = action_state.get_selected_entry()
				actions.close(prompt_bufnr) -- Close Telescope
				if entry then
					vim.cmd("cd " .. vim.fn.fnameescape(entry.value)) -- Change dir
					vim.cmd("e " .. vim.fn.fnameescape(entry.value))
				end
			end)
			return true
		end,
	})
end, { desc = "cd to dir" })

------------------------------ terminal----------------------------
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

----------------------------Terminal apps-------------------------------------
-- lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", display_name = "Lazygit", direction = "float", hidden = true })
function _Lazygit_toggle()
	lazygit:toggle()
end

map({ "n", "t" }, "<A-g>", "<cmd>lua _Lazygit_toggle()<cr>", { desc = "Toggle floating term with Lazygit" })

-- sysmonitor
local btop = Terminal:new({ cmd = "btop", display_name = "Btop", direction = "float", hidden = true })
function _Btop_toggle()
	btop:toggle()
end

map({ "n", "t" }, "<A-b>", "<cmd>lua _Btop_toggle()<cr>", { desc = "Toggle floating term with system monitor" })
--------------------------

map({ "c", "t" }, "<c-v>", "<C-R>+")
if vim.g.neovide then
	vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
