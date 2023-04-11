-- my_winnew_events.lua

local function custom_diagnostics_highlight()
  local lsp = vim.lsp
  local severity = lsp.protocol.DiagnosticSeverity
  local buf_diagnostics = lsp.diagnostic.get_all()

  local function set_filename_highlight(node, hl_group)
    local data = node:get_data()
    if data and data.absolute_path then
      for _, diagnostics in ipairs(buf_diagnostics) do
        for _, diagnostic in ipairs(diagnostics) do
          if
            diagnostic.range
            and diagnostic.range.start
            and diagnostic.range.start.line
            and diagnostic.source
            and diagnostic.source == data.absolute_path
          then
            vim.highlight.range(0, hl_group, data.absolute_path, diagnostic.range.start.line, 0, -1, true)
            break
          end
        end
      end
    end
  end

  local function update_diagnostics_highlight()
    local tree = require "nvim-tree.lib"
    local get_node_at_line = tree.get_node_at_line
    local nodes = tree.get_node_at_line()

    for _, node in ipairs(nodes) do
      if node:is_file() then
        local hl_group = "NvimTreeFile"
        for _, diagnostics in ipairs(buf_diagnostics) do
          for _, diagnostic in ipairs(diagnostics) do
            if diagnostic.severity == severity.Error then
              hl_group = "NvimTreeLspDiagnosticsError"
              break
            end
          end
        end
        set_filename_highlight(node, hl_group)
      end
    end
  end

  -- Schedule diagnostics highlight update on CursorHold
  vim.cmd "autocmd CursorHold * lua update_diagnostics_highlight()"
end

custom_diagnostics_highlight()
