local M = {}

function M.setup()
    -- Set highlights
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

    require('gitsigns').setup {
        signs = {
            add = { text = '│' },
            change = { text = '│' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Enable current line blame
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,  -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
    }
end

return M
