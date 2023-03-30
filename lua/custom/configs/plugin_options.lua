local M = {}

M.mason_lspconfig = {
  ensure_installed = {
    -- mandatory
    "rust_analyzer",
    "lua_ls",
    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
  },

  automatic_installation = true,
}

M.mason_nullls = {
  ensure_installed = {
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

return M
