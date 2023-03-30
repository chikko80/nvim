local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
    -- Override plugin definition options
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
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
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
        },
        config = function()
            require "custom.configs.lsp_zero"
        end,
        lazy = false,
    },


    {
        'simrat39/rust-tools.nvim',
        config = function()
            print("Calling config for rust-tools.nvim")
            require "custom.configs.rust_tools"
        end,
        lazy = false,
    },
    --
    -- -- override plugin configs
    -- {
    --   "williamboman/mason.nvim",
    --   opts = overrides.mason,
    -- },

    {
        "nvim-treesitter/nvim-treesitter",
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },
    -- Install a plugin
    {
        "chikko80/error-lens.nvim",
        lazy = false,
    },

    {
        "kenn7/vim-arsync",
        lazy = false,
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

    -- {
    --   "RRethy/vim-illuminate",
    --   lazy = false,
    --       config = function (_, opts)
    --
    --   require('illuminate').configure({})
    --       end
    -- },

    -- TODO event on save
    {
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
    },

    {
        "kdheepak/lazygit.nvim",
        lazy = false,
    },

    {
        "mbbill/undotree",
        config =
            function()
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
        config =
            function()
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
        dependencies = { "jvgrootveld/telescope-zoxide", "nvim-telescope/telescope-fzy-native.nvim" },
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
            extensions_list = { "themes", "terms", "zoxide", "fzy_native" },
            extensions = {
                zoxide = {
                    prompt_title = "[ Walking on the shoulders of TJ ]",
                },
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
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
