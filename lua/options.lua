local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------- Options --------------------------------------
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

o.termguicolors = true

--- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

o.wrap = false

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.hlsearch = false
o.incsearch = true

--- Line numbers
o.number = true
o.relativenumber = true

o.scrolloff = 8

o.colorcolumn = "80"

--- Disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

--- Disable swap file
o.swapfile = false
o.backup = false
o.updatetime = 50

--- Go to next line at end of line
opt.whichwrap:append "<>[]hl"

--- Set mapleader
g.mapleader = " "


--- Set default terminal to powershell core
opt.shell = vim.fn.executable('pwsh') ~= 0 and 'pwsh' or 'powershell'
opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
opt.shellredir = "2>&1 | %{ \"$\" } | Out-File %s; exit $LastExitCode"
opt.shellpipe = "2>&1 | %{ \"$\" } | tee %s; exit $LastExitCode"
opt.shellquote = ''
opt.shellxquote = ''
