local M = {}

function M.setup()

  local comment = require "Comment"

  comment.setup {
    active = true,
    on_config_done = nil,
    ---Add a space b/w comment and the line
    ---@type boolean
    padding = true,

    ---Whether cursor should stay at the
    ---same position. Only works in NORMAL
    ---mode mappings
    sticky = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ---@type string|function
    ignore = "^$",

    ---Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
    ---@type table
    mappings = {
      ---operator-pending mapping
      ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
      basic = true,
      ---Extra mapping
      ---Includes `gco`, `gcO`, `gcA`
      extra = true,
    },

    ---LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
    ---@type table
    toggler = {
      ---line-comment toggle
      line = "<leader>cc",
      ---block-comment toggle
      block = "<leader>bc",
    },

    ---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
    ---@type table
    opleader = {
      ---line-comment opfunc mapping
      line = "<leader>c",
      ---block-comment opfunc mapping
      block = "<leader>b",
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
      ---Add comment on the line above
      above = "<leader>cO",
      ---Add comment on the line below
      below = "<leader>co",
      ---Add comment at the end of line
      eol = "<leader>cA",
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
  }

  local ft = require "Comment.ft"
  ft
    .set('verilog', {'//%s', '/*%s*/'})
    .set('systemverilog', {'//%s', '/*%s*/'})
end

return M
