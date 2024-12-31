local M = {}

function M.setup()
    require("telescope").setup({
        defaults = {
            layout_strategy = "center",
            layout_config = {
                center = {
                    width = 0.7,        -- Percentage of screen width
                    height = 0.35,      -- Percentage of screen height
                    preview_cutoff = 0, -- Show preview always
                    prompt_position = "top"
                },
            },
            sorting_strategy = "ascending",
            winblend = 0, -- Transparency (0-100)
            border = true,
            borderchars = {
                prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
                preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false,
                layout_config = {
                    width = 0.6,
                    height = 0.7
                }
            },
            buffers = {
                theme = "dropdown",
                previewer = false,
                layout_config = {
                    width = 0.6,
                    height = 0.7
                }
            },
            help_tags = {
                theme = "dropdown",
                layout_config = {
                    width = 0.6,
                    height = 0.7
                }
            },
            live_grep = {
                theme = "dropdown",
                layout_config = {
                    width = 0.6,
                    height = 0.7
                }
            }
        }
    })
end

return M
