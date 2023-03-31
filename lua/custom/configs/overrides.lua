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

-- local test = require("copilot_cmp")

M.nvim_cmp = {
  mapping = {
    ["<Up>"] = require("cmp").mapping.select_prev_item(),
    ["<Down>"] = require("cmp").mapping.select_next_item(),
    ["<Tab>"] = require("cmp").mapping.confirm {
      behavior = require("cmp").ConfirmBehavior.Replace,
      select = false,
    },
  },
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  -- override for sorting
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot-cmp.comparators").prioritize,
      -- Below is the default comparitor list and order for nvim-cmp
      require("cmp").config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      require("cmp").config.compare.exact,
      require("cmp").config.compare.score,
      require("cmp").config.compare.recently_used,
      require("cmp").config.compare.locality,
      require("cmp").config.compare.kind,
      require("cmp").config.compare.sort_text,
      require("cmp").config.compare.length,
      require("cmp").config.compare.order,
    },
  },
}

return M
