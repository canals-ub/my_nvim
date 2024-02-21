-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local api = vim.api
local g = vim.g
local opt = vim.opt
local bo = vim.bo

opt.syntax = "on" -- Enable syntax highlighting
opt.winbar = "%=%m %f"
vim.cmd("set t_Co=256") --Support 256 colors
opt.termguicolors = true -- Enable colors in terminal
