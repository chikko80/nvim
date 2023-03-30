local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "chikko80/error-lens.nvim",

    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {}
    end,
  },
  {
    "kenn7/vim-arsync",
  },
  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      auto_restore_enabled = true,
      auto_save_enabled = true,
    },
    lazy = false,
  },

  {

    "tpope/vim-repeat",
  },
  {

    "tpope/vim-surround",
  },
  {

    "RRethy/vim-illuminate",
  },
  {

    "Djancyp/better-comments.nvim",
  },

  {

    "ggandor/leap.nvim",
  },

  {

    "kdheepak/lazygit.nvim",
        lazy = false
  },

  {

    "mbbill/undotree",
  },
  {

    "rcarriga/nvim-notify",
  },
  {

    "wakatime/vim-wakatime",
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
