local M = {}

function M.setup()
  require("lualine").setup{
      options = {
          theme = "iceberg",
      },
  }
end
return M
