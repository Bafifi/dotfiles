local M = {}

function M.setup()
    require("lsp_signature").setup({
        bind = true,
        handler_opts = {
            border = "rounded"
        },
        hint_enable = true, -- Shows parameter hints inline
        hint_prefix = "🔍 ", -- Prefix for parameter hints
        hint_scheme = "String", -- Highlight group for hints
        hi_parameter = "Search", -- Highlight group for current parameter
        max_height = 12, -- Max height of signature floating window
        max_width = 120, -- Max width of signature floating window
        wrap = true, -- Wrap long signatures
        floating_window = true, -- Show floating window for signatures
        floating_window_above_cur_line = true, -- Try to place window above cursor line
        toggle_key = "<C-k>", -- Toggle signature window with Ctrl-k
    })
end

return M
