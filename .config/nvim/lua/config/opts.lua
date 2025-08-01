vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set terminal gui colors to true
vim.opt.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = true

vim.o.laststatus = 3
vim.o.showmode = false

-- Make line numbers default
vim.wo.number = false
vim.wo.relativenumber = false
vim.o.ruler = false
vim.o.numberwidth = 2

vim.wo.signcolumn = "yes"

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

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 400

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Stuff
vim.o.conceallevel = 0
vim.o.cursorline = true
vim.o.cursorlineopt = "both" -- to enable relative and absolute cursor line!
vim.o.filetype = "on"
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.whichwrap:append("<>[]hl")
vim.opt.shortmess:append("sI")
vim.o.scrolloff = 5
vim.o.encoding = "utf-8"
vim.o.wrap = false

-- greek in normal mode
vim.opt.langmap =
	"ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.guifont = "JetBrainsMono NF SemiBold:h10"
vim.g.neovide_position_animation_length = 0.0
vim.g.neovide_scroll_animation_length = 0.20
vim.g.neovide_refresh_rate = 144
vim.opt.termguicolors = true
