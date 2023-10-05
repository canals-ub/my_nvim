local api = vim.api
local g = vim.g
local opt = vim.opt
local bo = vim.bo

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

vim.cmd("set t_Co=256")                            --Support 256 colors
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.incsearch = true
opt.scrolloff = 8

bo.shiftwidth = 2
bo.tabstop = 2
bo.softtabstop = 2
bo.textwidth = 120

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
-- remove tilling white spaces when save
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

vim.cmd [[autocmd BufNewFile, Bufread *.v, *.vs set syntax=verilog]]

