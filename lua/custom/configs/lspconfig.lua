local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local setup_on_attach = require("custom.configs.setup").setup_on_attach

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "lua_ls" }


for bufnr, lsp in ipairs(servers) do
  -- print("Attaching")
  lspconfig[lsp].setup {
    on_attach = function(client)
      on_attach(client, bufnr)
      setup_on_attach(client)
    end,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
