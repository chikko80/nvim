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

return M
