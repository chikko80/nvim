local M = {}

M.mason_lspconfig = {
  ensure_installed = {
    -- mandatory
    -- "clangd",
    "texlab",
    "rust_analyzer",
    "lua_ls",
    "pyright",
  },

  automatic_installation = true,
}

M.mason_nullls = {
  ensure_installed = {
    "autopep8",
    "stylua",
    "prettierd",
  },

  automatic_setup = true,
}
-- {
--   "RRethy/vim-illuminate",
--   lazy = false,
--   config = function()
--     require("illuminate").configure()
--     vim.cmd "highlight IlluminatedWordText guibg=#3b3f45 "
--     vim.cmd "highlight IlluminatedWordRead guibg=#3b3f45 "
--     vim.cmd "highlight IlluminatedWordWrite guibg=#3b3f45 "
--   end,
-- },

M.error_lens = {
  enabled = true,
  colors = {
    error_fg = "#FF6363", -- diagnostic font color
    error_bg = "#4B252C", -- diagnostic line color
    warn_fg = "#FA973A",
    warn_bg = "#403733",
    info_fg = "#FA973A",
    info_bg = "#403733",
    hint_fg = "#FA973A",
    hint_bg = "#403733",
  },
}

M.better_comments = {
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

M.copilot = {

  panel = {
    enabled = false,
    auto_refresh = false,
  },

  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-l>",
    },
  },
  copilot_node_command = "node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
}

M.notice = {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    -- hover = {
    --   enabled = false,
    -- },
    -- signature = {
    --   enabled = false,
    -- },
  },

  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
  },
}

return M
