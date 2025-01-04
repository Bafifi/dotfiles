local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

-- Set font
opt.guifont = "JetBrainsMono Nerd Font Mono:h12"
opt.termguicolors = true


-- Enable syntax and filetype settings
cmd('syntax on')
cmd('filetype on')
cmd('filetype plugin on')
cmd('filetype indent on')

-- General settings
opt.relativenumber = true
opt.number = true
opt.cursorline = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.hlsearch = true
opt.history = 1000
opt.scrolloff = 5


-- Additional important options
opt.mouse = 'a'
opt.wrap = false
opt.breakindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.signcolumn = 'no'
opt.termguicolors = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = 'menuone,noselect'
opt.signcolumn = "yes"

-- Set up cursorline autocommands
local cursorline_group = api.nvim_create_augroup("CursorLineNrHighlight", { clear = true })

api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FocusGained" }, {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = true
    end,
})

api.nvim_create_autocmd({ "WinLeave", "BufLeave", "FocusLost" }, {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = false
    end,
})

vim.g.loaded_health_provider = 1
