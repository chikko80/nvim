local overrides = require "custom.configs.overrides"
local options = require "custom.configs.plugin_options"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "williamboman/mason.nvim",
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = options.mason_lspconfig,
      },
      {
        "jay-babu/mason-null-ls.nvim",
        opts = options.mason_nullls,
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
          require("lspsaga").setup {}
        end,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          --Please make sure you install markdown and markdown_inline parser
          { "nvim-treesitter/nvim-treesitter" },
        },
      },
      {
        "simrat39/rust-tools.nvim",
        event = "LspAttach",
        ft = "rs",
        config = function()
          require "custom.configs.rust_tools"
        end,
        lazy = false,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- ? Core plugins

  -- NOTE: keep copilot before core plugin overridden otherwise cmp can't source it
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- event = "InsertEnter",
    opts = options.copilot,
    lazy = false,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    -- dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = false,
      },
    },
    lazy = false,
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.nvim_cmp,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag", -- todo doesn't work
    },
    opts = overrides.treesitter,
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  { "echasnovski/mini.ai", version = "*", lazy = false },

  {
    "echasnovski/mini.bufremove",
    version = "*",
    lazy = false,
  },

  {
    "chikko80/error-lens.nvim",
    event = "LspAttach",
    opts = options.error_lens,
  },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = options.error_lens,
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      require("illuminate").configure()
      vim.cmd "highlight IlluminatedWordText guibg=#3b3f45 "
      vim.cmd "highlight IlluminatedWordRead guibg=#3b3f45 "
      vim.cmd "highlight IlluminatedWordWrite guibg=#3b3f45 "
    end,
  },

  {
    "mrjones2014/nvim-ts-rainbow", -- * new plugin
    lazy = false,
  },

  -- ? Utility plugins
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
    lazy = false,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "kenn7/vim-arsync",
    lazy = false,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "dstein64/vim-startuptime",
    lazy = false,
  },

  {

    "folke/noice.nvim",
    opts = options.notice,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    lazy = false,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      vim.keymap.set({ "n", "x", "v" }, ";", function()
        local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
          return vim.api.nvim_win_get_config(win).focusable
        end, vim.api.nvim_tabpage_list_wins(0))
        require("leap").leap { target_windows = focusable_windows_on_tabpage }
      end)
    end,
  },

  -- ? UI plugins
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
  },

  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_SetFocusWhenToggle = true
      vim.g.undotree_WindowLayout = 3
    end,
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
}

return plugins
