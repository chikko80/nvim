local M = {}

M.treesitter = {
    ensure_installed = {
        "bash",
        "bibtex",
        "css",
        "dockerfile",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "latex",
        "python",
        "solidity",
        "sql",
        "toml",
        "typescript",
        "vue",
        "yaml",
        "c", "lua", "vim", "help", "query",
        "markdown",
        "markdown_inline",
    },
    indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
    },
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "rust" },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
            "#d79921",
            "#b16286",
            "#458588",
            "#a89984",
            "#689d6a",
            "#d65d0e",
            "#524091",
        },
    },
    autotag = {
        enable = true,
    },
}

M.mason = {
    ensure_installed = {
        -- mandatory
        "rust_analyzer",
        "prettierd",

        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
    },
}

-- git support in nvimtree
M.nvimtree = {
    actions = {
        open_file = {
            resize_window = true,
            window_picker = {
                enable = false,
            },
        },
    },
    git = {
        enable = true,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

-- TODO
M.telescope = {
    pickers = {
        buffers = {
            ignore_current_buffer = true,
            sort_mru = true,
        },
        -- find_files = {
        -- hidden = true
        -- }
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            -- case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
    extensions_list = { "themes", "terms", "fzy-native", "zoxide" },
}
--
M.cmp = {
    -- -- sources for autocompletion
    -- https://www.reddit.com/r/neovim/comments/u3c3kw/how_do_you_sorting_cmp_completions_items/
    sources = {
        { name = "path" },     -- file system paths
        { name = "nvim_lsp" }, -- lsp
        { name = "buffer" },   -- text within current buffer
        { name = "luasnip" },  -- snippets
        -- { name = "spell" },     -- spell
        -- { name = "look" },     -- dictionary
    },
}


return M
