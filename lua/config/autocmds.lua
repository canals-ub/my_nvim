-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- remove tilling white spaces when save
-- vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]
--
vim.cmd([[autocmd BufNewFile,Bufread,BufEnter *.v,*.sv,*.va,*.vh set syntax=verilog]])

vim.cmd([[autocmd FileType verilog,systemverilog,verilogams setlocal commentstring=//\ %s]])
