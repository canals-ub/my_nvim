local M = {}

function M.setup()
  local builtin = require('telescope.builtin')

  local status, whichkey = pcall(require, "which-key")
  if not status then
    return
  end

  whichkey.register({
    f = {
      name = "files", -- group name (optional)
      b = { "<cmd>Telescope file_browser<cr>", "File browser"},
      f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
      g = { "<cmd>Telescope git_files<cr>", "Git File" }, -- create a binding with label
      h = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "Browser here"},
      o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- create a binding with label
      n = { "<cmd>enew<cr>", "New File"},
    },
  }, {prefix = "<leader>"})

  require("telescope").load_extension "file_browser"
end

return M
