local M = {}

function M.setup()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
            },
        },
        filters = {
            dotfiles = false,
        },
        git = {
            enable = true,
            ignore = false,
        },
        actions = {
            open_file = {
                quit_on_open = true,
                window_picker = {
                    enable = true,
                },
            },
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
    })
end

return M
