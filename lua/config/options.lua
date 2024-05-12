local options = {
    clipboard       = "unnamed,unnamedplus",
    cmdheight       = 3,
    completeopt     = "menu,menuone,noselect",
    cursorline      = true,
    cursorlineopt   = "number",
    emoji           = false,
    expandtab       = true,
    foldcolumn      = "0",
    foldnestmax     = 0,
    foldlevel       = 99,
    foldlevelstart  = 99,
    ignorecase      = true,
    laststatus      = 3,
    mouse           = "a",
    number          = true,
    pumheight       = 10,
    relativenumber  = true,
    scrolloff       = 8,
    shiftwidth      = 4,
    showtabline     = 2,
    signcolumn      = "yes:2",
    smartcase       = true,
    smartindent     = true,
    smarttab        = true,
    softtabstop     = 4,
    splitright      = true,
    swapfile        = false,
    tabstop         = 4,
    termguicolors   = true,
    timeoutlen      = 200,
    undofile        = true,
    updatetime      = 100,
    viminfo         = "'1000",
    wildignore      = "*node_modules/**",
    wrap            = false,
    writebackup     = false,
    -- Neovim defaults
    autoindent      = true,
    backspace       = "indent,eol,start",
    backup          = false,
    -- Concealed text needs custom char for tailwind
    conceallevel    = 2,
    concealcursor   = "",
    encoding        = "utf-8",
    errorbells      = false,
    fileencoding    = "utf-8",
    hlsearch        = false,
    incsearch       = true,
    showmode        = false,
}

local globals = {
    mapleader               = " ",
    maplocalleader          = ",",
    loaded_netrw            = 1,
    loaded_netrwPlugin      = 1,
    neovide_floating_shadow = false,
}

vim.opt.shortmess:append("csI");
vim.opt.whichwrap:append("<>[]hl");
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.opt.fillchars:append('stl: ');
vim.opt.fillchars:append('eob: ');
vim.opt.fillchars:append('fold: ');
vim.opt.fillchars:append('foldopen: ');
vim.opt.fillchars:append('foldsep: ');
vim.opt.fillchars:append('foldclose:');

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(globals) do
    vim.g[k] = v
end

--- Set default terminal to powershell core
vim.opt.shell = vim.fn.executable('pwsh') ~= 0 and 'pwsh' or 'powershell'
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
vim.opt.shellredir = "2>&1 | %{ \"$\" } | Out-File %s; exit $LastExitCode"
vim.opt.shellpipe = "2>&1 | %{ \"$\" } | tee %s; exit $LastExitCode"
vim.opt.shellquote = ''
vim.opt.shellxquote = ''
