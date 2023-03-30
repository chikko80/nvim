require("rust-tools").setup {
  server = {
    on_attach = function(_, _)
      -- print "Attaching Rust Tools"
      -- lsp_setup.setup_on_attach(client)
        --  TODO keymaps
    end,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        -- checkOnSave = {
        --     command = "clippy",
        -- }
      },
    },
  },
}
