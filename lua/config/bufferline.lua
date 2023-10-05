local M = {}

function M.setup()
  require('bufferline').setup{
    options = {
      offsets = {
          {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true
          },
      }
    }
  }
end

  -- move between buffers or tabs
  vim.keymap.set("n","<tab>",vim.cmd.bnext,{desc = 'Next Buffer'})
  vim.keymap.set("n","<S-l>",vim.cmd.bnext,{desc = 'Next Buffer'})
  vim.keymap.set("n","<S-h>",vim.cmd.bprev,{desc = 'Previous Buffer'} )

return M
