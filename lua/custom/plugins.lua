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
  -- override plugin configs
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

  -- Install a plugin

  {
    "chikko80/error-lens.nvim",
    event = "LspAttach",
    opts = options.error_lens,
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

  -- -- doesn't work
  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      require("illuminate").configure()
      vim.cmd("highlight IlluminatedWordText guibg=#3b3f45 ")
      vim.cmd("highlight IlluminatedWordRead guibg=#3b3f45 ")
      vim.cmd("highlight IlluminatedWordWrite guibg=#3b3f45 ")
    end,
  },

  {
    -- TODO event on save
    "Djancyp/better-comments.nvim",
    lazy = false,
    config = function()
      require("better-comment").Setup {
        tags = {
          {
            name = "!",
            fg = "#FF2D00",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "?",
            fg = "#3498DB",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "//",
            fg = "#474747",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "todo",
            fg = "#FF8C00",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "TODO",
            fg = "#FF8C00",
            bg = "",
            bold = true,
            virtual_text = "",
          },
          {
            name = "*",
            fg = "#98C379",
            bg = "",
            bold = true,
            virtual_text = "",
          },
        },
      }
    end,
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
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow", -- * new plugin
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-fzy-native.nvim" },
    opts = {
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_mru = true,
        },
        -- find_files = {
        -- hidden = true
        -- }
      },
      extensions_list = { "themes", "terms", "fzy_native" },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          -- case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
