local overrides = require "custom.configs.overrides"
local options = require "custom.configs.plugin_options"
---@type NvPluginSpec[]
local plugins = {
  -- NOTE: keep copilot before core plugin overridden otherwise cmp can't source it
  -- {

  {
    -- event = "InsertEnter",
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = options.copilot,
  },

  -- NOTE: LSP configs
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
          require("lspsaga").setup {
            symbol_in_winbar = {
              enable = false,
            },
          }
        end,
        dependencies = {
          { "nvim-tree/nvim-web-devicons" },
          --Please make sure you install markdown and markdown_inline parser
          -- { "nvim-treesitter/nvim-treesitter" },
        },
      },
      {
        "simrat39/rust-tools.nvim",
        ft = "rs",
        config = function()
          require "custom.configs.rust_tools"
        end,
        lazy = false, -- NOTE: errors happening if not lazy
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- ? Core plugins

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cmd = "Telescope",
      },
    },
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.nvim_cmp,
    dependencies = {
      {
        "uga-rosa/cmp-dictionary",
        config = function()
          local dict = require "cmp_dictionary"

          dict.setup {
            -- The following are default values.
            exact = 2,
            first_case_insensitive = false,
            document = false,
            document_command = "wn %s -over",
            async = false,
            sqlite = false,
            max_items = -1,
            capacity = 5,
            debug = false,
          }

          dict.switcher {
            spelllang = {
              en = "~/.config/nvim/dict/top50k",
            },
          }
        end,
        lazy = false, -- load lazy since file is big this
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {

        "windwp/nvim-ts-autotag", -- todo doesn't work
      },
      {
        "mrjones2014/nvim-ts-rainbow", -- * new plugin
      },
    },
    opts = overrides.treesitter,
  },

  {
    "chikko80/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  { "echasnovski/mini.ai", version = "*", cmd = "InsertEnter" },

  {
    -- dir = "/Users/chikko/vsCodeProjects/error-lens.nvim",
    "chikko80/error-lens.nvim",
    event = "BufRead",
    opts = options.error_lens,
  },

  {
    "chikko80/testplug",
    config = function()
      require("better-window").setup()
    end,
    event = "VimEnter",
    enabled = true,
  },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
  },

  -- ? Utility plugins
  {
    "rmagatti/auto-session",
    event = "VimEnter",
    opts = {
      log_level = "error",
      auto_restore_enabled = true,
      auto_save_enabled = true,
    },
    enabled = true,
  },

  {
    "tpope/vim-surround",
    event = "InsertEnter",
  },

  {
    "RRethy/vim-illuminate",
    event = "BufRead",
    config = function()
      require("illuminate").configure()
      vim.cmd "highlight IlluminatedWordText guibg=#3b3f45 "
      vim.cmd "highlight IlluminatedWordRead guibg=#3b3f45 "
      vim.cmd "highlight IlluminatedWordWrite guibg=#3b3f45 "
    end,
  },

  {
    "wakatime/vim-wakatime",
    event = "VimEnter",
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  {
    "folke/noice.nvim",
    event = "VimEnter",
    opts = options.notice,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "ggandor/leap.nvim",
    event = "InsertEnter",
    config = function()
      -- grey out search area
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
      vim.keymap.set({ "n", "x", "v" }, ";", function()
        local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
          return vim.api.nvim_win_get_config(win).focusable
        end, vim.api.nvim_tabpage_list_wins(0))
        require("leap").leap { target_windows = focusable_windows_on_tabpage }
      end)
    end,
    dependencies = {
      {
        "ggandor/flit.nvim",
        config = function()
          require("flit").setup {}
        end,
      },
      {
        "tpope/vim-repeat",
      },
    },
  },

  -- ? UI plugins
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },

  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_SetFocusWhenToggle = true
      vim.g.undotree_WindowLayout = 3
    end,
    cmd = "UndotreeToggle",
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "petertriho/nvim-scrollbar",
    event = "BufRead",
    config = function()
      require("scrollbar").setup()
    end,
  },

  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = true,
        execution_message = {
          message = function() -- message to print on save
            return "" -- no message
          end,
        },
        events = { "InsertLeave", "TextChanged" },
        write_all_buffers = true,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 500,
      }
    end,
    lazy = false,
  },
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      vim.g.vimtex_view_method = ""
      vim.g.vimtex_quickfix_enabled = 0
      vim.g.maplocalleader = " "
    end,
  },
}

return plugins
