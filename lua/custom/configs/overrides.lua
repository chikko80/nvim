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
    "todotxt",
    "c",
    "lua",
    "vim",
    "help",
    "query",
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
}

return M
