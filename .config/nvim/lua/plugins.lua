-- packer.nvim auto install
local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require("packer").startup(
  function(use)
    use { "wbthomason/packer.nvim" }

    --------------------------------
    -- Global
    --------------------------------
    use { "lewis6991/impatient.nvim" }
    use { "b0o/mapx.nvim" }
    use { "vim-jp/vimdoc-ja" }

    use {
      "rcarriga/nvim-notify",
      config = function()
        require "rc.notify"
      end,
    }

    use { "nathom/filetype.nvim" }

    use {
      "monkoose/matchparen.nvim",
      config = function()
        require("matchparen").setup()
      end,
    }

    --------------------------------
    -- Lsp
    --------------------------------
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    --------------------------------
    -- Code
    --------------------------------
    -- auto complete
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "hrsh7th/cmp-calc", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      },
      event = { "InsertEnter", "CmdlineEnter" },
      config = function()
        require "rc.cmp"
      end,
    }

    ------------------------
    -- Appearance plugins --
    ------------------------
    use { "rebelot/kanagawa.nvim" }
    use {
      "windwp/windline.nvim",
      config = function()
        require "rc.windline"
      end,
    }
    use { "dstein64/nvim-scrollview" }
    use {
      "akinsho/nvim-bufferline.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "rc.bufferline"
      end,
    }

    use {
      "puremourning/vimspector",
      ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      config = function()
        vim.g.vimspector_install_gadgets = { "vscode-node-debug2" }
        vim.g.vimspector_enable_mappings = "HUMAN"
      end,
    }

    -- Path navigation
    use 'justinmk/vim-dirvish'

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "rc.indentLine"
      end,
    }

    -------------
    -- Coading --
    -------------
    -- debugger
    use {
      "mfussenegger/nvim-dap",
      module = { "dap" },
      config = function()
        require "rc.dap"
      end,
    }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, module = { "dapui" } }

    use {
      "windwp/nvim-autopairs",
      event = { "InsertEnter" },
      after = { "nvim-cmp" },
      config = function()
        require("nvim-autopairs").setup {
          enable_check_bracket_line = false,
        }
      end,
    }

    use {
      "windwp/nvim-ts-autotag",
      ft = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "xml",
        "php",
      },
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    }
  if packer_bootstrap then
    require("packer").sync()
  end
end)
