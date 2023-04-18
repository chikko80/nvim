local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "lua_ls", "pyright", "texlab" }

for bufnr, lsp in ipairs(servers) do
  -- print("Attaching")
  lspconfig[lsp].setup {
    on_attach = function(client)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  }
end
