local M = {}

function M.setup()
    -- Custom diagnostics component with colored icons
    local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        symbols = {
            error = "✘ ",
            warn = "⚠ ",
            info = "󰋼 ",
            hint = "󰌵 ",
        },
        colored = true,
        diagnostics_color = {
            error = { fg = '#ff0000' }, -- Bright red for errors
            warn  = { fg = '#ffae00' }, -- Bright orange for warnings
            info  = { fg = '#00bfff' }, -- Light blue for info
            hint  = { fg = '#00ff00' }, -- Green for hints
        },
        update_in_insert = false,
        always_visible = false,
    }

    require('lualine').setup {
        options = {
            theme = 'catppuccin',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            globalstatus = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = {
                { 'filename', path = 1 }, -- Show relative path
                diagnostics,              -- Add diagnostics here
            },
            lualine_x = {
                {
                    -- Show LSP client name
                    function()
                        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then return "" end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return ""
                    end,
                },
                'encoding',
                'fileformat',
                'filetype'
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
    }
end

return M
