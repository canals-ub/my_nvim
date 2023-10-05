
local M = {}

function M.setup()

  local lsp = require("lsp-zero")

  lsp.preset("recommended")

  lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'pylsp',
    --'jedi-language-server',
    --'slvs',
    'svlangserver'
  })

  -- Fix Undefined global 'vim'
  lsp.configure('lua_ls', {
      settings = {
          Lua = {
              diagnostics = {
                  globals = { 'vim' }
              }
          }
      }
  })


  local cmp = require('cmp')
  local cmp_select = {behavior = cmp.SelectBehavior.Select}
  local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })

  -- disable completion with tab
  -- this helps with copilot setup
  cmp_mappings['<Tab>'] = nil
  cmp_mappings['<S-Tab>'] = nil

  lsp.setup_nvim_cmp({
    mapping = cmp_mappings
  })

  lsp.set_preferences({
      suggest_lsp_servers = false,
      sign_icons = {
          error = 'E',
          warn = 'W',
          hint = 'H',
          info = 'I'
      }
  })

  lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=bufnr, remap=false, desc='go definition'})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=bufnr, remap=false, desc='hover info'})
    vim.keymap.set("n", "<leader>dd", '<cmd>Telescope diagnostics<CR>')
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=bufnr, remap=false, desc="next"})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=bufnr, remap=false, desc="prev"})
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {buffer=bufnr, remap=false, desc='in pop-up'})
    vim.keymap.set("n", "<leader>vw", vim.lsp.buf.workspace_symbol, {buffer=bufnr, remap=false, desc='ws symbol'})
    vim.keymap.set("n", "<leader>vc", vim.lsp.buf.code_action, {buffer=bufnr, remap=false, desc="code action"})
    vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, {buffer=bufnr, remap=false, desc="rename"})
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  end)

  local wk = require("which-key")
  wk.register({
    d = {
      name = "diagnostic", -- optional group name
    },
    v = {
      name = "view",
    },
  }, { prefix = "<leader>" })

  lsp.setup()

  vim.diagnostic.config({
      virtual_text = true,
  })
end
return M
