local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Colorscheme
    use {
			"https://codeberg.org/oahlen/iceberg.nvim",
   --   "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme iceberg"
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }
     -- file explorer
    use {
      'nvim-tree/nvim-tree.lua',
      config = function()
        require("config.nvim-tree").setup()
      end,
    }
    use {
      "nvim-tree/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }
    -- fuzzy finding
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
          require("config.telescope").setup()
        end,
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync =    true })
            require("config.treesitter").setup()
        end,
    })

    -- movement between splits
    --use "christoomey/vim-tmux-navigator"

    -- buffer line support
    use {
      "akinsho/bufferline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.bufferline").setup()
      end,
    }

    -- auto pairs
    use {
      "windwp/nvim-autopairs",
      opt = true,
      event = "InsertEnter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    }
    -- Better surround
    use { "tpope/vim-surround", event = "BufReadPre" }
    use {
      "Matt-A-Bennett/vim-surround-funk",
      event = "BufReadPre",
      config = function()
        require("config.surroundfunk").setup()
      end,
      disable = true,
    }

    --
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('config.comment').setup()
      end
    }

    -- Status line
    use {
      "nvim-lualine/lualine.nvim",
      event = "BufReadPre",
      config = function()
        require("config.lualine").setup()
      end,
    }

    -- verilog instance
    use { 'antoinemadec/vim-verilog-instance' }

    -- lsp, snippets, autocomplete
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'jose-elias-alvarez/null-ls.nvim'},
        },
        config = function()
          require("config.lsp").setup()
          require("config.null-ls").setup()
        end,
    }

    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("config.which-key").setup()
      end
    }
    -- https://nvimluau.dev/zbirenbaum-copilot-lua
    use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("config.copilot").setup()
      end,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
