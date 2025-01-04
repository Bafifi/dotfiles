local M = {}

function M.setup()
    -- GitSigns Theme
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#00FF00' }) -- Green for newlines
    vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = '#00FF00' })
    vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = '#00FF00' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#FFFF00' }) -- Yellow for changes
    vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { fg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { fg = '#FFFF00' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#FF0000' }) -- Red for deletes
    vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = '#FF0000' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = '#FF0000' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { fg = '#FF0000' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { fg = '#FF0000' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { fg = '#FF0000' })

    require("catppuccin").setup({
        flavour = "mocha", -- Can be: latte, frappe, macchiato, mocha
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    })

    -- Set colorscheme
    vim.cmd.colorscheme "catppuccin"
end

return M
