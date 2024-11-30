vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = true

vim.o.laststatus = 3
vim.o.showmode = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.ruler = false
vim.o.numberwidth = 2

-- Tabs vs spaces
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.opt.fillchars = { eob = " " }

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 400

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Set terminal gui colors to true
vim.o.termguicolors = true

-- Stuff
vim.o.conceallevel = 0
vim.o.cursorline = true
vim.o.cursorlineopt = "both" -- to enable relative and absolute cursor line!
vim.o.filetype = "on"
vim.o.syntax = "on"
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.whichwrap:append("<>[]hl")
vim.opt.shortmess:append("sI")

vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
