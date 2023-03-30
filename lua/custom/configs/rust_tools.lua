local lsp_setup = require("custom.configs.setup")

local rt = require("rust-tools")
rt.setup(
    {
        server = {
            on_attach = function(client, bufnr)
                print("Attaching Rust Tools")
                lsp_setup.setup_on_attach(client, bufnr)
            end,
            settings = {
                -- to enable rust-analyzer settings visit:
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ["rust-analyzer"] = {
                    -- enable clippy on save
                    -- checkOnSave = {
                    --     command = "clippy",
                    -- }
                }
            }
        }
    }
)
