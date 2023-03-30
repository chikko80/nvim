local lsp_setup = require "custom/configs/setup"

local lsp = require("lsp-zero").preset {
    name = "recommended",
    -- set_lsp_keymaps = true,
    -- manage_nvim_cmp = true,
    -- suggest_lsp_servers = false,
}

lsp.ensure_installed {
    "lua_ls",
    "rust_analyzer",
    "solidity",
}


lsp.on_attach(function(client, bufnr)
    print "Caling attach in lsp zero"
    lsp_setup.setup_on_attach(client, bufnr)
end)

lsp.setup()
