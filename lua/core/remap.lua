-- Set the map leader to a space character
vim.g.mapleader = " "

-- Remap "kj" in insert mode to "<Esc>"
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

-- Map "J" in visual mode to move selected lines down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Map "K" in visual mode to move selected lines up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Map "<leader>Y" in normal mode to yank entire line
vim.keymap.set("n", "<leader>Y", [[]])

-- Map "<leader>p" in visual mode to replace selected text with default register contents
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Map "Q" in normal mode to no-operation (disable default behavior)
vim.keymap.set("n", "Q", "<nop>")

-- Map "<leader>f" in normal mode to trigger code formatting
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)

