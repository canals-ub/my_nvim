local M = {}

function M.setup()
  local nvim_tree = require "nvim-tree"
  vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, {desc="File tree"})
  nvim_tree.setup {
    disable_netrw = false,
    hijack_netrw = true,
    respect_buf_cwd = true,
    view = {
      number = true,
      relativenumber = true,
    },
    filters = {
      custom = { ".git" },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  }
end


return M
